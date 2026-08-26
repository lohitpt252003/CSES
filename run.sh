#!/bin/bash

# Color codes for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Default limits
TIME_LIMIT=1
MEM_LIMIT=512
TARGET_DIR=""

# Parse command line flags
while getopts "d:t:m:" opt; do
  case $opt in
    d) TARGET_DIR="$OPTARG" ;;
    t) TIME_LIMIT="$OPTARG" ;;
    m) MEM_LIMIT="$OPTARG" ;;
    *) 
      echo -e "${RED}Invalid flag usage.${NC}"
      echo "Usage: ./run.sh -d <directory> [-t time_in_s] [-m memory_in_mb]"
      exit 1 
      ;;
  esac
done

if [ -z "$TARGET_DIR" ]; then
  echo -e "${RED}Error:${NC} Directory flag (-d) is required."
  exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${RED}Error:${NC} Directory '$TARGET_DIR' does not exist."
    exit 1
fi

MEM_LIMIT_KB=$((MEM_LIMIT * 1024))
cd "$TARGET_DIR" || exit 1
cpp_found=false

# Check if GNU time is available for deep stats (Linux/WSL)
HAS_GNU_TIME=false
if command -v /usr/bin/time > /dev/null 2>&1; then
    HAS_GNU_TIME=true
fi

FINAL_REPORT="\n${CYAN}================ FINAL REPORT ================${NC}\n"

for cpp_file in *.cpp; do
    [ -e "$cpp_file" ] || continue
    
    cpp_found=true
    echo "----------------------------------------"
    echo "Compiling: $cpp_file"
    echo -e "Limits: ${YELLOW}${TIME_LIMIT}s${NC} / ${YELLOW}${MEM_LIMIT}MB${NC}"
    
    g++ -O2 -std=c++17 -Wall "$cpp_file" -o solution_exec
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}Compilation Failed!${NC}"
        FINAL_REPORT+="${RED}✗${NC} $(printf "%-20s" "$cpp_file") : Compilation Failed\n"
        continue
    fi

    echo "Running tests..."
    test_files=$(ls -v tests/*.in 2>/dev/null)
    
    if [ -z "$test_files" ]; then
        echo -e "${YELLOW}Warning:${NC} No test files (*.in) found in the tests/ directory."
        FINAL_REPORT+="${YELLOW}!${NC} $(printf "%-20s" "$cpp_file") : No Tests Found\n"
        rm -f solution_exec
        continue
    fi

    count_ac=0; count_wa=0; count_tle=0; count_mle=0; count_re=0; total_tests=0

    for in_file in $test_files; do
        [ -e "$in_file" ] || continue
        ((total_tests++))
        
        test_name=$(basename "$in_file" .in)
        expected_out="tests/${test_name}.out"
        user_out="tests/${test_name}.user_out"
        stats_file="tests/${test_name}.stats"

        if [ ! -f "$expected_out" ]; then
            echo -e "${RED}Error:${NC} Missing expected output '$expected_out'"
            continue
        fi

        run_time="N/A"
        run_mem="N/A"

        # OS-Aware Execution
        if [ "$HAS_GNU_TIME" = true ]; then
            # Linux / WSL mode: Perfect Time and Memory tracking
            (
                ulimit -v "$MEM_LIMIT_KB" 2>/dev/null
                /usr/bin/time -f "%e %M" -o "$stats_file" timeout "${TIME_LIMIT}s" ./solution_exec < "$in_file" > "$user_out" 2>/dev/null
            )
            EXEC_CODE=$?
            
            if [ -f "$stats_file" ]; then
                read raw_time raw_mem < "$stats_file"
                if [ ! -z "$raw_time" ]; then run_time="${raw_time}s"; fi
                if [[ "$raw_mem" =~ ^[0-9]+$ ]]; then
                    run_mem=$(awk "BEGIN {printf \"%.2fMB\", $raw_mem/1024}")
                fi
                rm -f "$stats_file"
            fi
        else
            # Windows / Git Bash mode: Custom bash TIMEFORMAT for accurate time
            (
                ulimit -v "$MEM_LIMIT_KB" 2>/dev/null
                TIMEFORMAT="%R"
                { time timeout "${TIME_LIMIT}s" ./solution_exec < "$in_file" > "$user_out" 2>/dev/null ; } 2> "$stats_file"
            )
            EXEC_CODE=$?
            
            # Memory cannot be natively tracked via Git Bash
            run_mem="N/A (Win)"
            
            if [ -f "$stats_file" ]; then
                # Extract the time output injected by TIMEFORMAT
                raw_time=$(tail -n 1 "$stats_file" | tr -d '\r\n ')
                if [[ "$raw_time" =~ ^[0-9]+\.[0-9]+$ ]] || [[ "$raw_time" =~ ^[0-9]+$ ]]; then
                    run_time="${raw_time}s"
                fi
                rm -f "$stats_file"
            fi
        fi

        status_text=""
        status_color=""

        if [ $EXEC_CODE -eq 124 ]; then
            status_text="TLE"
            status_color=$YELLOW
            ((count_tle++))
            run_time=">${TIME_LIMIT}s"
        elif [ $EXEC_CODE -eq 139 ] || [ $EXEC_CODE -eq 137 ]; then
            status_text="MLE/RE"
            status_color=$MAGENTA
            ((count_mle++))
        elif [ $EXEC_CODE -ne 0 ]; then
            status_text="RE"
            status_color=$MAGENTA
            ((count_re++))
        else
            if diff -w "$user_out" "$expected_out" > /dev/null; then
                status_text="AC"
                status_color=$GREEN
                ((count_ac++))
            else
                status_text="WA"
                status_color=$RED
                ((count_wa++))
            fi
        fi

        echo -e "Test $(printf "%-3s" "$test_name"): ${status_color}[$status_text]${NC} - Time: $run_time | Mem: $run_mem"

        if [ "$status_text" == "WA" ]; then
            # echo "   --- Input ---"
            # sed 's/^/   /' "$input" | head -n 10
            echo "   --- Expected ---"
            sed 's/^/   /' "$expected_out" | head -n 10
            echo "   --- Got ---"
            sed 's/^/   /' "$user_out" | head -n 10
            echo "   ----------------"
        fi
    done
    
    if [ "$total_tests" -eq "$count_ac" ] && [ "$total_tests" -gt 0 ]; then
        FINAL_REPORT+="${GREEN}✓${NC} $(printf "%-20s" "$cpp_file") : "
    else
        FINAL_REPORT+="${RED}✗${NC} $(printf "%-20s" "$cpp_file") : "
    fi
    
    FINAL_REPORT+="${GREEN}${count_ac} AC${NC} | ${RED}${count_wa} WA${NC} | ${YELLOW}${count_tle} TLE${NC} | ${MAGENTA}${count_mle} MLE${NC} | ${MAGENTA}${count_re} RE${NC}\n"

    rm -f solution_exec tests/*.user_out tests/*.stats
done

if [ "$cpp_found" = false ]; then
    echo -e "${RED}Error:${NC} No .cpp files found in $TARGET_DIR."
else
    echo -e "$FINAL_REPORT"
    echo -e "${CYAN}==============================================${NC}"
fi


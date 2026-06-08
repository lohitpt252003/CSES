# 🏆 CSES Problem Set Solutions & Local Judge Setup

Welcome to my repository for the [CSES Problem Set](https://cses.fi/problemset/)! 

This repository contains my accepted C++ solutions for the CSES problem set, along with the official test cases. More importantly, it features a **custom local judge setup** written in Bash that mimics the behavior of real competitive programming platforms.

## ✨ Features
* **Automated Workspace Generation:** Instantly scaffold a new problem directory with boilerplate C++ code and a dedicated `tests/` folder.
* **Judge-Level Local Testing:** Run your code against multiple `.in` and `.out` test cases automatically.
* **Accurate Verdicts:** Detects and reports standard verdicts including:
  * `[AC]` Accepted
  * `[WA]` Wrong Answer (prints a diff of Expected vs. Got)
  * `[TLE]` Time Limit Exceeded
  * `[MLE/RE]` Memory Limit Exceeded / Runtime Error
* **Time & Memory Profiling:** Accurately tracks peak memory usage and execution time per test case (fully supported on Linux/WSL, with time-tracking fallback for Windows Git Bash).

## 📂 Project Structure
```text
📦 CSES-Solutions
 ┣ 📜 init.sh                  # Script to initialize a new problem folder
 ┣ 📜 run.sh                   # The local judge script
 ┗ 📂 Weird Algorithm          # Example problem directory
   ┣ 📜 solution.cpp           # The C++ solution
   ┗ 📂 tests                  # Directory containing test cases
     ┣ 📜 1.in                 
     ┣ 📜 1.out                
     ┣ 📜 2.in
     ┗ 📜 2.out

```

## 🚀 Getting Started

### Prerequisites

* `g++` compiler (supports C++17)
* A Bash environment (Linux, macOS, WSL, or Git Bash on Windows)
* *(Optional)* GNU `/usr/bin/time` for exact memory tracking on Linux/WSL.

### 1. Initialize a Problem

Use the `init.sh` script to set up your workspace. This will create the folder, the `tests/` subdirectory, and a boilerplate `.cpp` file.

```bash
chmod +x init.sh
./init.sh "Problem Name"

```

### 2. Add Test Cases

Navigate into your new problem folder and place your test cases inside the `tests/` directory. Ensure they are paired perfectly by number (e.g., `1.in` and `1.out`).

### 3. Run the Local Judge

Write your solution in `solution.cpp`. When you are ready to evaluate, use the `run.sh` script from the root directory.

**Basic Usage (Defaults to 1s time limit and 512MB memory limit):**

```bash
./run.sh -d "Problem Name"

```

**Custom Limits:**
You can pass flags to strictly enforce Time (`-t` in seconds) and Memory (`-m` in Megabytes) limits.

```bash
./run.sh -d "Problem Name" -t 2 -m 256

```

### 📊 Example Output

```text
----------------------------------------
Compiling: solution.cpp
Limits: 1s / 512MB
Running tests...
Test 1  : [AC] - Time: 0.01s | Mem: 1.48MB
Test 2  : [WA] - Time: 0.01s | Mem: 1.50MB
   --- Expected ---
   10 5 16 8 4 2 1
   --- Got ---
   10 5 15 7 3
   ----------------
Test 3  : [TLE] - Time: >1s | Mem: 2.10MB

================ FINAL REPORT ================
✗ solution.cpp         : 1 AC | 1 WA | 1 TLE | 0 MLE | 0 RE
==============================================

```

## 💻 About the Solutions

All solutions are written in `C++17`. The focus is on clean, optimal logic using standard data structures and algorithms ranging from basic sorting to advanced dynamic programming and graph theory. Feel free to explore the folders to understand different approaches to the problems!


| Section | Problem Count |
| --- | --- |
| Introductory Problems | 24 |
| Sorting and Searching | 35 |
| Dynamic Programming | 23 |
| Graph Algorithms | 36 |
| Range Queries | 25 |
| Tree Algorithms | 16 |
| Mathematics | 37 |
| String Algorithms | 21 |
| Geometry | 16 |
| Advanced Techniques | 25 |
| Sliding Window Problems | 11 |
| Interactive Problems | 6 |
| Bitwise Operations | 11 |
| Construction Problems | 8 |
| Advanced Graph Problems | 28 |
| Counting Problems | 18 |
| Additional Problems I | 30 |
| Additional Problems II | 30 |
| **Total** | **400** |



### Introductory Problems (24)

* [x] Weird Algorithm
* [x] Missing Number
* [x] Repetitions
* [x] Increasing Array
* [x] Permutations
* [ ] Number Spiral
* [ ] Two Knights
* [x] Two Sets
* [x] Bit Strings
* [x] Trailing Zeros
* [ ] Coin Piles
* [ ] Palindrome Reorder
* [ ] Gray Code
* [ ] Tower of Hanoi
* [ ] Creating Strings
* [ ] Apple Division
* [ ] Chessboard and Queens
* [ ] Raab Game I
* [ ] Mex Grid Construction
* [ ] Knight Moves Grid
* [ ] Grid Coloring I
* [ ] Digit Queries
* [ ] String Reorder
* [ ] Grid Path Description

### Sorting and Searching (35)

* [ ] Distinct Numbers
* [ ] Apartments
* [ ] Ferris Wheel
* [ ] Concert Tickets
* [ ] Restaurant Customers
* [ ] Movie Festival
* [ ] Sum of Two Values
* [ ] Maximum Subarray Sum
* [ ] Stick Lengths
* [ ] Missing Coin Sum
* [ ] Collecting Numbers
* [ ] Collecting Numbers II
* [ ] Playlist
* [ ] Towers
* [ ] Traffic Lights
* [ ] Distinct Values Subarrays
* [ ] Distinct Values Subsequences
* [ ] Josephus Problem I
* [ ] Josephus Problem II
* [ ] Nested Ranges Check
* [ ] Nested Ranges Count
* [ ] Room Allocation
* [ ] Factory Machines
* [ ] Tasks and Deadlines
* [ ] Reading Books
* [ ] Sum of Three Values
* [ ] Sum of Four Values
* [ ] Nearest Smaller Values
* [ ] Subarray Sums I
* [ ] Subarray Sums II
* [ ] Subarray Divisibility
* [ ] Distinct Values Subarrays II
* [ ] Array Division
* [ ] Movie Festival II
* [ ] Maximum Subarray Sum II

### Dynamic Programming (23)

* [ ] Dice Combinations
* [ ] Minimizing Coins
* [ ] Coin Combinations I
* [ ] Coin Combinations II
* [ ] Removing Digits
* [ ] Grid Paths I
* [ ] Book Shop
* [ ] Array Description
* [ ] Counting Towers
* [ ] Edit Distance
* [ ] Longest Common Subsequence
* [ ] Rectangle Cutting
* [ ] Minimal Grid Path
* [ ] Money Sums
* [ ] Removal Game
* [ ] Two Sets II
* [ ] Mountain Range
* [ ] Increasing Subsequence
* [ ] Projects
* [ ] Elevator Rides
* [ ] Counting Tilings
* [ ] Counting Numbers
* [ ] Increasing Subsequence II

### Graph Algorithms (36)

* [ ] Counting Rooms
* [ ] Labyrinth
* [ ] Building Roads
* [ ] Message Route
* [ ] Building Teams
* [ ] Round Trip
* [ ] Monsters
* [ ] Shortest Routes I
* [ ] Shortest Routes II
* [ ] High Score
* [ ] Flight Discount
* [ ] Cycle Finding
* [ ] Flight Routes
* [ ] Round Trip II
* [ ] Course Schedule
* [ ] Longest Flight Route
* [ ] Game Routes
* [ ] Investigation
* [ ] Planets Queries I
* [ ] Planets Queries II
* [ ] Planets Cycles
* [ ] Road Reparation
* [ ] Road Construction
* [ ] Flight Routes Check
* [ ] Planets and Kingdoms
* [ ] Giant Pizza
* [ ] Coin Collector
* [ ] Mail Delivery
* [ ] De Bruijn Sequence
* [ ] Teleporters Path
* [ ] Hamiltonian Flights
* [ ] Knight's Tour
* [ ] Download Speed
* [ ] Police Chase
* [ ] School Dance
* [ ] Distinct Routes

### Range Queries (25)

* [ ] Static Range Sum Queries
* [ ] Static Range Minimum Queries
* [ ] Dynamic Range Sum Queries
* [ ] Dynamic Range Minimum Queries
* [ ] Range Xor Queries
* [ ] Range Update Queries
* [ ] Forest Queries
* [ ] Hotel Queries
* [ ] List Removals
* [ ] Salary Queries
* [ ] Prefix Sum Queries
* [ ] Pizzeria Queries
* [ ] Visible Buildings Queries
* [ ] Range Interval Queries
* [ ] Subarray Sum Queries
* [ ] Subarray Sum Queries II
* [ ] Distinct Values Queries
* [ ] Distinct Values Queries II
* [ ] Increasing Array Queries
* [ ] Movie Festival Queries
* [ ] Forest Queries II
* [ ] Range Updates and Sums
* [ ] Polynomial Queries
* [ ] Range Queries and Copies
* [ ] Missing Coin Sum Queries

### Tree Algorithms (16)

* [ ] Subordinates
* [ ] Tree Matching
* [ ] Tree Diameter
* [ ] Tree Distances I
* [ ] Tree Distances II
* [ ] Company Queries I
* [ ] Company Queries II
* [ ] Distance Queries
* [ ] Counting Paths
* [ ] Subtree Queries
* [ ] Path Queries
* [ ] Path Queries II
* [ ] Distinct Colors
* [ ] Finding a Centroid
* [ ] Fixed-Length Paths I
* [ ] Fixed-Length Paths II

### Mathematics (37)

* [ ] Josephus Queries
* [ ] Exponentiation
* [ ] Exponentiation II
* [ ] Counting Divisors
* [ ] Common Divisors
* [ ] Sum of Divisors
* [ ] Divisor Analysis
* [ ] Prime Multiples
* [ ] Counting Coprime Pairs
* [ ] Next Prime
* [ ] Binomial Coefficients
* [ ] Creating Strings II
* [ ] Distributing Apples
* [ ] Christmas Party
* [ ] Permutation Order
* [ ] Permutation Rounds
* [ ] Bracket Sequences I
* [ ] Bracket Sequences II
* [ ] Counting Necklaces
* [ ] Counting Grids
* [ ] Fibonacci Numbers
* [ ] Throwing Dice
* [ ] Graph Paths I
* [ ] Graph Paths II
* [ ] System of Linear Equations
* [ ] Sum of Four Squares
* [ ] Triangle Number Sums
* [ ] Dice Probability
* [ ] Moving Robots
* [ ] Candy Lottery
* [ ] Inversion Probability
* [ ] Stick Game
* [ ] Nim Game I
* [ ] Nim Game II
* [ ] Stair Game
* [ ] Grundy's Game
* [ ] Another Game

### String Algorithms (21)

* [ ] Word Combinations
* [ ] String Matching
* [ ] Finding Borders
* [ ] Finding Periods
* [ ] Minimal Rotation
* [ ] Longest Palindrome
* [ ] All Palindromes
* [ ] Required Substring
* [ ] Palindrome Queries
* [ ] Finding Patterns
* [ ] Counting Patterns
* [ ] Pattern Positions
* [ ] Distinct Substrings
* [ ] Distinct Subsequences
* [ ] Repeating Substring
* [ ] String Functions
* [ ] Inverse Suffix Array
* [ ] String Transform
* [ ] Substring Order I
* [ ] Substring Order II
* [ ] Substring Distribution

### Geometry (16)

* [ ] Point Location Test
* [ ] Line Segment Intersection
* [ ] Polygon Area
* [ ] Point in Polygon
* [ ] Polygon Lattice Points
* [ ] Minimum Euclidean Distance
* [ ] Convex Hull
* [ ] Maximum Manhattan Distances
* [ ] All Manhattan Distances
* [ ] Intersection Points
* [ ] Line Segments Trace I
* [ ] Line Segments Trace II
* [ ] Lines and Queries I
* [ ] Lines and Queries II
* [ ] Area of Rectangles
* [ ] Robot Path

### Advanced Techniques (25)

* [ ] Meet in the Middle
* [ ] Hamming Distance
* [ ] Corner Subgrid Check
* [ ] Corner Subgrid Count
* [ ] Reachable Nodes
* [ ] Reachability Queries
* [ ] Cut and Paste
* [ ] Substring Reversals
* [ ] Reversals and Sums
* [ ] Necessary Roads
* [ ] Necessary Cities
* [ ] Eulerian Subgraphs
* [ ] Monster Game I
* [ ] Monster Game II
* [ ] Subarray Squares
* [ ] Houses and Schools
* [ ] Knuth Division
* [ ] Apples and Bananas
* [ ] One Bit Positions
* [ ] Signal Processing
* [ ] New Roads Queries
* [ ] Dynamic Connectivity
* [ ] Parcel Delivery
* [ ] Task Assignment
* [ ] Distinct Routes II

### Sliding Window Problems (11)

* [ ] Sliding Window Sum
* [ ] Sliding Window Minimum
* [ ] Sliding Window Xor
* [ ] Sliding Window Or
* [ ] Sliding Window Distinct Values
* [ ] Sliding Window Mode
* [ ] Sliding Window Mex
* [ ] Sliding Window Median
* [ ] Sliding Window Cost
* [ ] Sliding Window Inversions
* [ ] Sliding Window Advertisement

### Interactive Problems (6)

* [ ] Hidden Integer
* [ ] Hidden Permutation
* [ ] K-th Highest Score
* [ ] Permuted Binary Strings
* [ ] Colored Chairs
* [ ] Inversion Sorting

### Bitwise Operations (11)

* [ ] Counting Bits
* [ ] Maximum Xor Subarray
* [ ] Maximum Xor Subset
* [ ] Number of Subset Xors
* [ ] K Subset Xors
* [ ] All Subarray Xors
* [ ] Xor Pyramid Peak
* [ ] Xor Pyramid Diagonal
* [ ] Xor Pyramid Row
* [ ] SOS Bit Problem
* [ ] And Subset Count

### Construction Problems (8)

* [ ] Inverse Inversions
* [ ] Monotone Subsequences
* [ ] Third Permutation
* [ ] Permutation Prime Sums
* [ ] Chess Tournament
* [ ] Distinct Sums Grid
* [ ] Filling Trominos
* [ ] Grid Path Construction

### Advanced Graph Problems (28)

* [ ] Nearest Shops
* [ ] Prüfer Code
* [ ] Tree Traversals
* [ ] Course Schedule II
* [ ] Acyclic Graph Edges
* [ ] Strongly Connected Edges
* [ ] Even Outdegree Edges
* [ ] Graph Girth
* [ ] Fixed Length Walk Queries
* [ ] Transfer Speeds Sum
* [ ] MST Edge Check
* [ ] MST Edge Set Check
* [ ] MST Edge Cost
* [ ] Network Breakdown
* [ ] Tree Coin Collecting I
* [ ] Tree Coin Collecting II
* [ ] Tree Isomorphism I
* [ ] Tree Isomorphism II
* [ ] Flight Route Requests
* [ ] Critical Cities
* [ ] Visiting Cities
* [ ] Graph Coloring
* [ ] Bus Companies
* [ ] Split into Two Paths
* [ ] Network Renovation
* [ ] Forbidden Cities
* [ ] Creating Offices
* [ ] New Flight Routes

### Counting Problems (18)

* [ ] Filled Subgrid Count I
* [ ] Filled Subgrid Count II
* [ ] All Letter Subgrid Count I
* [ ] All Letter Subgrid Count II
* [ ] Border Subgrid Count I
* [ ] Border Subgrid Count II
* [ ] Raab Game II
* [ ] Empty String
* [ ] Permutation Inversions
* [ ] Counting Bishops
* [ ] Counting Sequences
* [ ] Grid Paths II
* [ ] Counting Permutations
* [ ] Grid Completion
* [ ] Counting Reorders
* [ ] Tournament Graph Distribution
* [ ] Collecting Numbers Distribution
* [ ] Functional Graph Distribution

### Additional Problems I (30)

* [ ] Shortest Subsequence
* [ ] Distinct Values Sum
* [ ] Distinct Values Splits
* [ ] Swap Game
* [ ] Beautiful Permutation II
* [ ] Multiplication Table
* [ ] Bubble Sort Rounds I
* [ ] Bubble Sort Rounds II
* [ ] Nearest Campsites I
* [ ] Nearest Campsites II
* [ ] Advertisement
* [ ] Special Substrings
* [ ] Counting LCM Arrays
* [ ] Square Subsets
* [ ] Subarray Sum Constraints
* [ ] Water Containers Moves
* [ ] Water Containers Queries
* [ ] Stack Weights
* [ ] Maximum Average Subarrays
* [ ] Subsets with Fixed Average
* [ ] Two Array Average
* [ ] Pyramid Array
* [ ] Permutation Subsequence
* [ ] Bit Inversions
* [ ] Writing Numbers
* [ ] Letter Pair Move Game
* [ ] Maximum Building I
* [ ] Sorting Methods
* [ ] Cyclic Array
* [ ] List of Sums

### Additional Problems II (30)

* [ ] Bouncing Ball Steps
* [ ] Bouncing Ball Cycle
* [ ] Knight Moves Queries
* [ ] K Subset Sums I
* [ ] K Subset Sums II
* [ ] Increasing Array II
* [ ] Food Division
* [ ] Swap Round Sorting
* [ ] Binary Subsequences
* [ ] School Excursion
* [ ] Coin Grid
* [ ] Grid Coloring II
* [ ] Programmers and Artists
* [ ] Removing Digits II
* [ ] Coin Arrangement
* [ ] Replace with Difference
* [ ] Grid Puzzle I
* [ ] Grid Puzzle II
* [ ] Bit Substrings
* [ ] Reversal Sorting
* [ ] Book Shop II
* [ ] GCD Subsets
* [ ] Minimum Cost Pairs
* [ ] Same Sum Subsets
* [ ] Mex Grid Queries
* [ ] Maximum Building II
* [ ] Stick Divisions
* [ ] Stick Difference
* [ ] Coding Company
* [ ] Two Stacks Sorting
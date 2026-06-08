section .bss
    inbuf resb 64       ; 64-byte buffer for reading input
    outbuf resb 64      ; 64-byte buffer for formatting output

section .text
    global _start

_start:
    ; ==========================================
    ; 1. READ INPUT (sys_read)
    ; ==========================================
    mov rax, 0          ; syscall number for sys_read (0)
    mov rdi, 0          ; file descriptor 0 (stdin)
    mov rsi, inbuf      ; pointer to input buffer
    mov rdx, 64         ; read up to 64 bytes
    syscall

    ; ==========================================
    ; 2. PARSE STRING TO INT (like cin >> n)
    ; ==========================================
    mov rsi, inbuf      ; point to start of input
    xor r8, r8          ; r8 will hold 'n'

parse_skip:
    ; Skip any leading whitespace or newlines
    movzx rcx, byte [rsi]
    inc rsi
    cmp rcx, '0'
    jl parse_skip
    cmp rcx, '9'
    jg parse_skip
    
    ; Found the first digit
    sub rcx, '0'        ; Convert ASCII to integer
    mov r8, rcx

parse_loop:
    ; Read the rest of the digits
    movzx rcx, byte [rsi]
    inc rsi
    cmp rcx, '0'
    jl parse_done       ; If less than '0' (like a newline), we are done
    cmp rcx, '9'
    jg parse_done       ; If greater than '9', we are done
    
    sub rcx, '0'        ; Convert ASCII to integer
    imul r8, 10         ; n = n * 10
    add r8, rcx         ; n = n + digit
    jmp parse_loop

parse_done:
    ; ==========================================
    ; 3. THE ALGORITHM (Trailing Zeros)
    ; ==========================================
    ; r8 = n
    xor r9, r9          ; r9 will hold 'ans' (init to 0)
    mov r10, 5          ; r10 will be 'i' (init to 5)

calc_loop:
    cmp r10, r8
    jg calc_done        ; If i > n, exit loop

    mov rax, r8         ; rax = n
    xor rdx, rdx        ; Clear rdx before division
    div r10             ; rax = n / i
    
    cmp rax, 0
    je calc_done        ; Safety break: if n / i == 0, we are done
    
    add r9, rax         ; ans += (n / i)

    ; i *= 5
    mov rax, r10
    mov rcx, 5
    mul rcx             ; rax = i * 5
    mov r10, rax        ; i = new value
    jmp calc_loop

calc_done:
    ; ==========================================
    ; 4. FORMAT INT TO STRING (like cout << ans)
    ; ==========================================
    mov rax, r9         ; rax holds 'ans'
    mov rsi, outbuf + 63; Point to the very end of our output buffer
    mov byte [rsi], 10  ; Append the newline character '\n'
    dec rsi
    mov rcx, 10         ; We will divide by 10 to extract digits

itoa_loop:
    xor rdx, rdx        ; Clear rdx for division
    div rcx             ; rax = rax / 10, rdx = rax % 10 (the digit)
    add dl, '0'         ; Convert digit to ASCII
    mov [rsi], dl       ; Store character in buffer
    dec rsi             ; Move backwards in buffer
    test rax, rax       ; Check if quotient is 0
    jnz itoa_loop       ; If not 0, keep extracting digits

    ; ==========================================
    ; 5. WRITE OUTPUT (sys_write) & EXIT
    ; ==========================================
    inc rsi             ; Point rsi to the first valid digit character
    mov rdx, outbuf + 64
    sub rdx, rsi        ; Calculate total length to print (end - start)

    mov rax, 1          ; syscall number for sys_write (1)
    mov rdi, 1          ; file descriptor 1 (stdout)
    syscall

    mov rax, 60         ; syscall number for sys_exit (60)
    xor rdi, rdi        ; exit code 0
    syscall
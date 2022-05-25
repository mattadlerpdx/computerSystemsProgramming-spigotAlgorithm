.global SpigotE 

.text

SpigotE:
    movb $2, (%rdi) ; output0=2
    movq %rdx, %r15 ; n=r15
    addq $1, %r15 ; n=n+1
    movq %r15, %rcx ; i = n+1
    jmp Test ;
Loop:
    movq $1, (%rsi,%rcx,8) ; workbufferI=1
    dec %rcx ; 
Test:
    cmp $0, %rcx
    jge Loop
    movq $1, %r8 ; j=1
    movq %rdx, %r13
    jmp Test2 ;
Loop2:
    xor %r9, %r9 ; q=0
    inc %r8 
    jmp Test3
Loop3:
    mov $10, %r14;
    imulq (%r12, %rcx, 8), %r14 ; 
    addq %r9,%r14 ; 

    movq $2, %r11
    addq %rcx, %r11 ;
    movq %r14, %rax ; 
    movq %rcx, %r11 ; r11=i+2

    xorq %rdx, %rdx

    divq %r11
    movq %rdx, (%rsi, %rcx, 8)
    movq %r9, (%rsi,%rcx,8) 
    dec %rcx
    jmp Test3   
Test2:
    cmp %r15, %r8 ; 
    jl Loop2 ;
Test3: 
    cmp $0, %rcx
    jge Loop3 ;
    movq %r9, (%rdi, %r8, 8) ; outputJ=q
    ret

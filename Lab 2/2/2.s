.data
    A:      .word         20,11,10,4,15    
    B:      .word         5,4,3,2,1 
    C:    .word     0
    N:     .word    5
    newline: .string "\n"
.bss
.text
.globl main
main:
    li a1,0
    lw a2,N
    li a5,4
    mul t5,a2,a5    #get the maximum address value 
    
    #load addresses of A,B and C arrays
    la t0, A
    la t4, B
    la t3,C
    add t4,t4,t5
loop:
    sub t4,t4,a5  
    bge a1,a2,exit
    #Get the addreses value of A
    lw a3,0(t0)
    add a6,t4,t6
    #Get the address value of B
    lw a4,0(a6)
    add a0,a3,a4
    #Save the value in C array
    sw a0, 0(t3)
    #Print values
    li a7, 1
    ecall
    
    la a0,newline        #print a new Line
    li a7, 4
    ecall
    
    addi t0,t0,4
    addi a1,a1,1
    j loop
exit:
    
    li a7, 10
    ecall
    
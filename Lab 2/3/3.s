.data
    A:      .word  0    
    B:      .word  1 
    C:    .word    0
    N:     .word   12
    newline: .string "\n"
.bss
.text
.globl main
main:
    lw a1,A        #add A address into a1
    addi a0,a1,0
    sw a0,0(a3)    #copy value into a0
    li a7, 1
    ecall
    
    la a0,newline        #print a new Line
    li a7, 4
    ecall
    
    lw a2,B
    
    la a3,C
    li a4,4
    lw a5,N
    lw t6,2
Loop:
    bge t6,a5,exit        #run loop from 2 to N
    add t1,a1,a2
    addi a3,a3,4
    
    sw t1,0(a3)        #store in the a3 register
    addi a0,t1,0
    
    la a0,newline        #print a new Line
    li a7, 4
    ecall
    
    
    li a7, 1        #print value
    ecall
    
    la a0,newline        #print a new Line
    li a7, 4
    ecall
    
    addi a2,t1,0    #move current value into a2
    sub a6,a3,a4    
    lw a1,0(a6)    #move before value into a1
    addi t6,t6,1
    j Loop
    
   
exit:
    li a7, 10
    ecall
    
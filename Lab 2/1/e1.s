.data
A:      .word    1, 2, 7, -8, 4, 5, 12, 11, -2, 6, 3
N:      .word   11
B:      .word  0   

.text
.globl main
main:
    la a6, A
    la a7, B

    # Load N into register a1
    lw a1, N

    li a2, 0    # Index for A
    li a3, 0    # Index for B

loop:
    # Check if a2 < N
    bge a2, a1, end

    # Load current element from A into a4
    lw a4, 0(a6)
    
    # Move to the next element in A
    addi a6, a6, 4
    # Increment index a2
    addi a2, a2, 1

    # Check if a4 is even
    andi a5, a4, 1
    # Check if a4 > 0
    blt a4,zero, not_even_or_negative
    
    bnez a5, not_even_or_negative

    # Store a4 into B array
    add a0, a7, a3
    sw a4, 0(a0)
    
    #mov a4 value into a0
    addi a0,a4,0

    # Increment index a3
    addi a3, a3, 4

    li a7, 1 
     # Print the current element
    ecall
    j loop

not_even_or_negative:
    j loop

end:
    li a7, 10        
    ecall

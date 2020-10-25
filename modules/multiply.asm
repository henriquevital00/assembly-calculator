;This module is responsible for sum multiply numbers

MULTIPLY:
    mov A,  R5
    mov B, R6
    mul AB
    mov R4, A
    RETI
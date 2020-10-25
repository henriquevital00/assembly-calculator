;This module is responsible for divide two numbers

DIVIDE:
    mov A,  R5
    mov B, R6
    div AB
    mov R4, A
    RETI
    

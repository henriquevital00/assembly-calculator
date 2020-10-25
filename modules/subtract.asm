;This module is responsible for subtract two numbers

SUBTRACT:
    mov A,  R5
    mov B, R6
    subb A, B
	inc A
    mov R4, A
    RETI

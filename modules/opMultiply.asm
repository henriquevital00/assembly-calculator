OP_MULTIPLY:
    mov A,  R5
    mov B, R6
    mul AB
    mov R3, A
	ACALL SHOW_RESULT
	ACALL LONG_DELAY
	ACALL CLEAR_ALL
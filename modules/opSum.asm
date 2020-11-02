OP_SUM:
    mov A,  R5
    mov B, R6
    add A, B
    mov R3, A
	ACALL SHOW_RESULT
	ACALL LONG_DELAY
	ACALL CLEAR_ALL
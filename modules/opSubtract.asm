OP_SUBTRACT:
    mov A,  R5
    mov B, R6
    subb A, B
	inc A
    mov R3, A
	ACALL SHOW_RESULT
	ACALL LONG_DELAY
	ACALL CLEAR_ALL
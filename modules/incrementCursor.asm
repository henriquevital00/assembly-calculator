INCREMENT_CURSOR:
    mov A, #0Eh
	INC 70h
	CALL delay
    CJNE A, 70h, RETURN
    mov 70h, #40h
	RET		

RETURN:
    RET
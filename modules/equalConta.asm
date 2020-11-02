EQUAL_CONTA:
	;ACALL clearDisplay

	;multiplicao
	MOV A, R4
	MOV B, #078h
	SUBB A, B
	JZ OP_MULTIPLY

	;divisao
	MOV A, R4
	MOV B, #02Fh
	SUBB A, B
	INC A
	JZ OP_DIVIDE

	;sutracao
	MOV A, R4
	MOV B, #02Dh
	SUBB A, B
	INC A
	JZ OP_SUBTRACT

	;soma
	MOV A, R4
	MOV B, #02Bh
	SUBB A, B
	INC A
	JZ OP_SUM

	RET
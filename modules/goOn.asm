GO_ON:
	JNB F0, ROTINA  
	MOV A, 70h
	ACALL posicionaCursor	
	MOV A, R4
	;se ja ha uma conta
	JNZ SETSECOND_REGISTER
	;conferir se ja digitou o primeiro
	MOV A, R5
	;se ja digitou
	JNZ VALIDARCONTA
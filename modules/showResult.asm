SHOW_RESULT:
	MOV A, 70h
	ACALL posicionaCursor
	mov A, #'='
	ACALL sendCharacter

	MOV A, R3
	MOV B, #10
	DIV AB
	ADD A, #30h
	ACALL sendCharacter
	MOV A,B
	ADD A, #30h
	ACALL sendCharacter
	ACALL delay
	;exibe a resposta do R3 no lcd
	RET

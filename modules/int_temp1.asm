org 0013h
INT_TEMP1:
	MOV A, 70h
	CALL INCREMENT_CURSOR

	ACALL SUBTRACT
	CLR IE0

	MOV R0, #0Dh
	MOV A, #50h
	ADD A, R0
	MOV R0, A
	MOV A, @R0
	ACALL CONTINUECODE

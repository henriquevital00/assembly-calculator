SETFIRST_REGISTER:
	MOV A, #50h
	ADD A, R0
	MOV R0, A
	MOV A, @R0
	MOV R5, A

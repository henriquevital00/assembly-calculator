CLEAR_ALL:
	MOV R2, #0h
	MOV R3, #0h
	MOV R4, #0h
	MOV R5, #0h
	MOV R6, #0h
	MOV 70h, #0h
	ACALL clearDisplay

	CLR A	
	MOV R0, #127	
	ACALL CLEAR_RAM
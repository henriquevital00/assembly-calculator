ROTINA:
	CLR F0
	SETB EA 
	SETB EX0 
	SETB EX1 
	SETB IT0 	
	SETB IT1 	
	ACALL leituraTeclado
	CJNE R0, #01h, GO_ON
	;signifca q o cara chamou o =
	ACALL EQUAL_CONTA
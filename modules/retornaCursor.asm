retornaCursor:
	CLR RS	
	CLR P1.7		
	CLR P1.6	
	CLR P1.5		
	CLR P1.4		

	SETB EN		
	CLR EN		

	CLR P1.7		
	CLR P1.6		
	SETB P1.5	
	SETB P1.4		

	SETB EN		
	CLR EN		

	CALL delay		
	RET
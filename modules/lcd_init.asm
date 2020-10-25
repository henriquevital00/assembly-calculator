lcd_init:

	CLR RS	

	CLR P1.7		
	CLR P1.6		
	SETB P1.5		
	CLR P1.4		

	SETB EN	
	CLR EN	

	CALL delay		

	SETB EN		
	CLR EN		

	SETB P1.7	

	SETB EN		
	CLR EN	

	CALL delay	

	CLR P1.7	
	CLR P1.6	
	CLR P1.5	
	CLR P1.4	

	SETB EN
	CLR EN	

	SETB P1.6	
	SETB P1.5		

	SETB EN	
	CLR EN	

	CALL delay	

	CLR P1.7	
	CLR P1.6	
	CLR P1.5	
	CLR P1.4	

	SETB EN	
	CLR EN	

	SETB P1.7		
	SETB P1.6		
	SETB P1.5		
	SETB P1.4	

	SETB EN		
	CLR EN	

	CALL delay		
	RET

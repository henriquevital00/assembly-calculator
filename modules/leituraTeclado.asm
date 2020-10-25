leituraTeclado:
	MOV R0, #0		

	; scan row0
	MOV P0, #0FFh	
	CLR P0.0		
	CALL colScan	
	JB F0, finish		
					
	; scan row1
	SETB P0.0			
	CLR P0.1		
	CALL colScan		
	JB F0, finish
					
	; scan row2
	SETB P0.1		
	CLR P0.2		
	CALL colScan	
	JB F0, finish		
						
	; scan row3
	SETB P0.2			
	CLR P0.3			
	CALL colScan	
	JB F0, finish	
						
finish:
	RET

colScan:
	JNB P0.4, gotKey
	INC R0				
	JNB P0.5, gotKey	
	INC R0		
	JNB P0.6, gotKey	
	INC R0				
	RET				
gotKey:
	SETB F0			
	RET				

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

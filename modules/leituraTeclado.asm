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
	CALL INCREMENT_CURSOR
	RET		
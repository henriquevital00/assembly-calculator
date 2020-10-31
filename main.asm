; --- Mapeamento de Hardware (8051) ---
    RS      equ     P1.3    ;Reg Select ligado em P1.3
    EN      equ     P1.2    ;Enable ligado em P1.2

org 0000h
	LJMP START

;sum rotine
org 0003h
INT_TEMP0:
	ACALL SUM
	CLR IE0
	RETI

;minus rotine
org 0013h
INT_TEMP1:
	ACALL SUBTRACT
	CLR IE0
	RETI

org 0080h
START:
	MOV R6, #0
	MOV R5, #0
; put data in RAM
	MOV 40H, #'/' 
	MOV 41H, #'='
	MOV 42H, #'*'
	MOV 43H, #'9'
	MOV 44H, #'8'
	MOV 45H, #'7'
	MOV 46H, #'6'
	MOV 47H, #'5'
	MOV 48H, #'4'
	MOV 49H, #'3'
	MOV 4AH, #'2'
	MOV 4BH, #'1'	

    MOV 50H, #'/' 
	MOV 51H, #'='
	MOV 52H, #'*'
	MOV 53H, #9
	MOV 54H, #8
	MOV 55H, #7
	MOV 56H, #6
	MOV 57H, #5
	MOV 58H, #4
	MOV 59H, #3
	MOV 5AH, #2
	MOV 5BH, #1	  

MAIN:
	ACALL lcd_init
ROTINA:
	ACALL leituraTeclado
	CJNE R0, #01h, GO_ON
	;signifca q o cara chamou o =
	ACALL EQUAL_CONTA

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

SETFIRST_REGISTER:
	MOV A, #50h
	ADD A, R0
	MOV R0, A
	MOV A, @R0  
	MOV R5, A

CONTINUECODE:
	MOV A, R0
	MOV B, #50h
	SUBB A, B
	MOV R0, A

	MOV A, #40h
	ADD A, R0
	MOV R0, A
	MOV A, @R0  
	ACALL sendCharacter

	CLR F0
	SETB EA 
	SETB EX0 
	SETB EX1 
	SETB IT0 	
	SETB IT1 		
	ACALL delay
	JMP ROTINA

EQUAL_CONTA:
	ACALL clearDisplay

	;multiplicao
	MOV A, R4
	MOV B, #078h
	SUBB A, B
	JZ OP_MULTIPLY

	;divisao
	MOV A, R4
	MOV B, #02Fh
	SUBB A, B
	INC A
	JZ OP_DIVIDE

	;sutracao
	MOV A, R4
	MOV B, #02Dh
	SUBB A, B
	INC A
	JZ OP_SUBTRACT

	;soma
	MOV A, R4
	MOV B, #02Bh
	SUBB A, B
	INC A
	JZ OP_SUM

	RET

SETSECOND_REGISTER:
	;MOV A, R6
	;se nao for zero ai vamo de conta 
	;JNZ VALIDARCONTA
	MOV A, #50h
	ADD A, R0
	MOV R0, A
	MOV A, @R0  
	MOV R6, A
	ACALL CONTINUECODE

VALIDARCONTA:
	MOV A, R0
	;se for 0 = /
	JZ DIVIDE
	MOV B, #2h
	SUBB A, B
	INC A
	JZ MULTIPLY
	ACALL ROTINA

DIVIDE:
	MOV R4, #'/'	
	MOV R0, #0h
	MOV A, #50h
	ADD A, R0
	MOV R0, A
	MOV A, @R0  
	ACALL CONTINUECODE

MULTIPLY:
	MOV R4, #'x'	
	MOV R0, #2h
	MOV A, #50h
	ADD A, R0
	MOV R0, A
	MOV A, @R0 
	ACALL CONTINUECODE

OP_DIVIDE:
    mov A,  R5
    mov B, R6
    div AB
    mov R3, A
	ACALL LONG_DELAY
	ACALL CLEAR_ALL
    RETI

OP_MULTIPLY:
    mov A,  R5
    mov B, R6
    mul AB
    mov R3, A
	ACALL LONG_DELAY
	ACALL CLEAR_ALL

OP_SUM:
    mov A,  R5
    mov B, R6
    add A, B
    mov R3, A
	ACALL LONG_DELAY
	ACALL CLEAR_ALL

OP_SUBTRACT:
    mov A,  R5
    mov B, R6
    subb A, B
	inc A
    mov R3, A
	ACALL LONG_DELAY
	ACALL CLEAR_ALL

SUBTRACT:
	MOV R4, #'-'	
	RETI

SUM:
	MOV R4, #'+'	
	RETI

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

INCREMENT_CURSOR:
    mov A, #0Eh
	INC 70h
	CALL delay
    CJNE A, 70h, RETURN
    mov 70h, #40h
	RET		

RETURN:
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

sendCharacter:
	SETB RS  	

	MOV C, ACC.7		
	MOV P1.7, C			
	MOV C, ACC.6		
	MOV P1.6, C			
	MOV C, ACC.5		
	MOV P1.5, C			
	MOV C, ACC.4		
	MOV P1.4, C		

	SETB EN		
	CLR EN		

	MOV C, ACC.3		
	MOV P1.7, C		
	MOV C, ACC.2		
	MOV P1.6, C			
	MOV C, ACC.1		
	MOV P1.5, C			
	MOV C, ACC.0		
	MOV P1.4, C			

	SETB EN			
	CLR EN			

	CALL delay		
	RET

posicionaCursor:
	CLR RS	
	SETB P1.7		   
	MOV C, ACC.6		
	MOV P1.6, C			
	MOV C, ACC.5		
	MOV P1.5, C			
	MOV C, ACC.4		
	MOV P1.4, C			

	SETB EN			
	CLR EN			

	MOV C, ACC.3
	MOV P1.7, C	
	MOV C, ACC.2
	MOV P1.6, C	
	MOV C, ACC.1
	MOV P1.5, C	
	MOV C, ACC.0
	MOV P1.4, C	 

	SETB EN			
	CLR EN			

	CALL delay			
	CALL delay		
	RET

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

clearDisplay:
	CLR RS	
	CLR P1.7		
	CLR P1.6		
	CLR P1.5		
	CLR P1.4	

	SETB EN		
	CLR EN	

	CLR P1.7		
	CLR P1.6		
	CLR P1.5		
	SETB P1.4	

	SETB EN		
	CLR EN		

	CALL delay	
	RET

delay:
	MOV R7, #50
	DJNZ R7, $
	RET

CLEAR_ALL:
	MOV R2, #0h
	MOV R3, #0h
	MOV R4, #0h
	MOV R5, #0h
	MOV R6, #0h
	ACALL clearDisplay
	ACALL ROTINA

LONG_DELAY:
	MOV R7, #255
	DJNZ R7, $
	RET

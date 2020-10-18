org 0000h
	LJMP START
	MOV R7, #0

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
	SETB EA 
	SETB EX0 
	SETB EX1 
	SETB IT0 	
	SETB IT1 		
	SJMP $

DIVIDE:
    mov A, #6h
    mov B, #2h
    div AB
    mov 44h, A
    mov 45h, B
    RETI

MULTIPLY:
    mov A, #6h
    mov B, #2h
    mul AB
    mov 44h, A
    RETI

SUBTRACT:
    mov A, #6h
    mov B, #2h
    subb A, B
    mov 44h, A
    RETI

SUM:
    mov A, #6h
    mov B, #2h
    add A, B
    mov 44h, A
    RETI


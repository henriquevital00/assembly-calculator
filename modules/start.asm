
org 0080h
START:
	MOV R4, #0h
	MOV R5, #0h
	MOV R6, #0h
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
	MOV 4CH, #'+'
	MOV 4DH, #'-'

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

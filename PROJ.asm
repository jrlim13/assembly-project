.MODEL SMALL
.STACK
.DATA
	;MAIN MENU
	PR DB 'ENTER OPTION: $'
	OP1 DB ' [1] EX3 $'	;EX3(OPTION)
	OP2	DB ' [2] EX4	$'	;EX4(OPTION)
	OP3	DB ' [3] EX5	$'	;EX4(OPTION)
	OP4	DB ' [4] EXIT $'	;EXIT
	NW DB 0DH,0AH,'$'	;NEWLINE CHARCTER
	CO DB 00000000B	;CHARACTER'S COLOR
	CH1 DB 2,0,1 DUP (' ')
	TMP DB 2 DUP (' ')
	UROW DB 0	;UPPER ROW
	UCOL DB 0	;UPPER COLUMN
	DROW DB 24	;LOWER ROW
	DCOL DB 79	;LOWER COLUMN
	TIME DW 0
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	LN DB 'LIM$'	;EX3
	FN DB 'JASMIN$'
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	ROW DB 0	;EX4
	COL DB 0
	LET DB 41H
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	S1 DB 'ENTER STRING: $'	;EX5
	BUFF DB 20,0,20 DUP(' ')	
	TEMP DB 20 DUP(' ')
	
.CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
M	PROC	;MAIN
	MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX
	
	CALL MENU
	CALL TER
M	ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MENU	PROC	;MAIN MENU
ENTRY:
	CALL CLS
	
	MOV ROW,15
	MOV UROW,15
	MOV DROW,15
	MOV COL,1
	MOV UCOL,1
	MOV DCOL,79
	MOV CO,00001100B
	CALL DSG
	MOV CX,35
	MOV TIME,1
SHWOP1:	
	CALL SCP
	MOV DX,OFFSET OP1
	CALL DSPS
	INC COL
	CALL DLY
	LOOP SHWOP1
	
	INC ROW
	INC UROW
	INC DROW
	MOV COL,1
	MOV CO,00001001B
	CALL DSG
	MOV CX,35
	MOV TIME,1
SHWOP2:
	CALL SCP 
	MOV DX,OFFSET OP2
	CALL DSPS
	INC COL
	CALL DLY
	LOOP SHWOP2
	
	INC ROW
	INC UROW
	INC DROW
	MOV COL,70
	MOV CO,00001010B
	CALL DSG
	MOV CX,36
	MOV TIME,1
SHWOP3:	
	CALL SCP 
	MOV DX,OFFSET OP3
	CALL DSPS
	DEC COL
	CALL DLY
	LOOP SHWOP3
	
	INC ROW
	INC UROW
	INC DROW
	MOV COL,70
	MOV CO,00001101B
	CALL DSG
	MOV CX,36
	MOV TIME,1
SHWOP4:
	CALL SCP 
	MOV DX,OFFSET OP4
	CALL DSPS
	DEC COL
	CALL DLY
	LOOP SHWOP4
	
	ADD ROW,2
	ADD UROW,2
	ADD DROW,2
	CALL SCP 
	
	MOV CO,00001110B
	CALL DSG
	
	MOV AH,9
	MOV DX,OFFSET PR
	INT 21H

	MOV AH,0AH	;PROMPT THE USER TO ENTER AN OPTION
	MOV DX,OFFSET CH1
	INT 21H
	
	MOV SI,OFFSET CH1
	MOV DI,OFFSET TMP
	
	INC SI
	LODSB
	MOV CL,AL
	MOV CH,0
	
LP1:	MOVSB
	LOOP LP1
	
	MOV AL,'$'
	STOSB
	CALL NL
	
	CMP TMP,'1'
		JE TH
	CMP TMP,'2'
		JE FO
	CMP TMP,'3'
		JE FI
	CMP TMP,'4'
		JE EXT
	JMP ENTRY

TH:	CALL CLS
	CALL THREE
	JMP RPT
	
FO: CALL CLS
	CALL FOUR
	JMP RPT

FI:	CALL CLS
	CALL FIVE
		
RPT:CALL ENT

EXT:RET
MENU	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

THREE	PROC	;EX3
	MOV AH,6	;CLEAR SCREEN
	MOV AL,0
	MOV BH,00000000B
	MOV CH,0
	MOV CL,00
	MOV DH,24
	MOV DL,79
	INT 10H
	
	MOV AH,6	
	MOV AL,0
	MOV BH,01000000B
	MOV CH,5
	MOV CL,25
	MOV DH,12
	MOV DL,32
	INT 10H
	
	MOV AH,6	
	MOV AL,0
	MOV BH,00100000B
	MOV CH,6
	MOV CL,26
	MOV DH,13
	MOV DL,33
	INT 10H
	
	MOV AH,6	
	MOV AL,0
	MOV BH,00010000B
	MOV CH,7
	MOV CL,27
	MOV DH,14
	MOV DL,34
	INT 10H
	
	MOV AH,2 	
	MOV BH,0
	MOV DH,10
	MOV DL,28
	INT 10H
	
	MOV AH,9
	MOV DX,OFFSET FN
	INT 21H
	
	MOV AH,6	
	MOV AL,0
	MOV BH,01000000B
	MOV CH,5
	MOV CL,42
	MOV DH,12
	MOV DL,47
	INT 10H
	
	MOV AH,6	
	MOV AL,0
	MOV BH,00100000B
	MOV CH,6
	MOV CL,41
	MOV DH,13
	MOV DL,46
	INT 10H
	
	MOV AH,6	
	MOV AL,0
	MOV BH,00010000B
	MOV CH,7
	MOV CL,40
	MOV DH,14
	MOV DL,45
	INT 10H
	
	MOV AH,2 	
	MOV BH,0
	MOV DH,10
	MOV DL,41
	INT 10H
	
	MOV AH,9
	MOV DX,OFFSET LN
	INT 21H
	
	MOV ROW,24
	MOV COL,79
	CALL SCP
	
	RET
THREE	ENDP

FOUR	PROC	;EX4
H:	CALL CLS
	MOV ROW,12
	MOV COL,39
	MOV LET,41H
	
U:	CALL SCP
	CALL DSP
	JMP U1

U2:	INC LET
U3:	CALL DSP
	
U1:	MOV AH,0
	INT 16H
	CMP AH,4DH ;RIGHT
		JE R
	CMP AH,50H ;DOWN
		JE D
	CMP AH,48H ;UP
		JE F
	CMP AH,4BH ; LEFT
		JE L
	CMP AH,47H	;HOME
		JE H
	CMP AH,1	;ESC
		JE E
	CMP AH,1CH
		JE MNU
	JMP U1
	
R:	CMP COL, 78	;RIGHT
		JE U3
	INC COL
	CMP COL, 78
		JE U2
	JMP U	
D:	CMP ROW, 24	;DOWN
		JE U3
	INC ROW
	CMP ROW, 24
		JE U2
	JMP U	
L: 	CMP COL, 1	;LEFT
		JE U3
	DEC COL
	CMP COL, 1
		JE U2
	JMP U
F:	CMP ROW, 0	;UP
		JE U3
	DEC ROW
	CMP ROW, 0	
		JE U2
	JMP U
	
MNU:CALL MENU

E:	RET
FOUR	ENDP

FIVE	PROC	;EX5
		MOV AH,9
		MOV DX,OFFSET S1	;PROMPT THE USER TO ENTER STRING
		INT 21H
		
		MOV AH,0AH
		MOV DX,OFFSET BUFF	;BUFFER FOR INPUT STRING
		INT 21H
		
		CALL NL
		
		MOV SI,OFFSET BUFF	;POINT SI AND DI TO THE BUFFERS
		MOV DI,OFFSET TEMP
		ADD SI,2	;POINT SI TO CHARACTER
		
ULIT:	LODSB	
		
		CMP AL,0DH	;IF AL=0DH, ENTER KEY
			JE X1
		CMP AL,20H
			JE A
		CMP AL,'A'	;CHECKS IF VOWEL
			JE ULIT
		CMP AL,'a'
			JE ULIT
		CMP AL,'E'
			JE ULIT
		CMP AL,'e'
			JE ULIT
		CMP AL,'I'
			JE ULIT
		CMP AL,'i'
			JE ULIT
		CMP AL,'O'
			JE ULIT
		CMP AL,'o'
			JE ULIT
		CMP AL,'U'
			JE ULIT
		CMP AL,'u'
			JE ULIT
S:		STOSB	;COPY THE CHARCTER TO DI
		JMP ULIT
		
A:		MOV AL,2AH
		JMP S	;JUMP TO STOSB

X1:		MOV AL,'$'
		STOSB
		
		MOV AH,9
		MOV DX,OFFSET TEMP	;DISPLAY STRING
		INT 21H

		RET
FIVE	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CLS	PROC	;CLEAR SCREEN
	MOV AH,6
	MOV AL,0
	MOV BH,7
	MOV CH,0
	MOV CL,0
	MOV DH,24
	MOV DL,79
	INT 10H
	RET
CLS	ENDP

DSG	PROC	;DESIGN 
	MOV AH,6	
	MOV AL,0
	MOV BH,CO
	MOV CH,UROW
	MOV CL,UCOL
	MOV DH,DROW
	MOV DL,DCOL
	INT 10H
	RET
DSG ENDP

SCP	PROC	;POSITION
	MOV AH,2
	MOV BH,0
	MOV DH,ROW
	MOV DL,COL
	INT 10H
	RET
SCP	ENDP

DSP PROC	;DISPLAY CHARACTER
	CALL SCP
	MOV AH,2
	MOV DL,LET
	INT 21H
	RET
DSP ENDP

TER	PROC
	MOV AH,4CH
	INT 21H
	RET
TER ENDP

NL	PROC
	MOV AH,9
	MOV DX,OFFSET NW
	INT 21H
	RET
NL	ENDP

ENT	PROC	;ENTER KEY TO GO BACK TO MENU
	MOV AH,0
	INT 16H
	CMP AH,1CH
		JE MNU2
MNU2:CALL MENU
	RET
ENT	ENDP

DSPS	PROC	;DISPLAY MOVING STRING
	MOV AH,9
	INT 21H
	RET
DSPS	ENDP

DLY	PROC	;ANIMATION DELAY
	PUSH CX
	MOV CX,TIME
	
Y:	PUSH CX
	MOV CX,0FFFFH
X:	LOOP X
	POP CX
	
	LOOP Y
	POP CX
	RET
DLY	ENDP

END M
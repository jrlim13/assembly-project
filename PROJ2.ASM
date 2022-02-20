.MODEL SMALL
.STACK
.DATA
	;MAIN MENU
	PR1 DB 'LOAD EXERCISE:$'
	PR2 DB '[ENTER] SELECT'
	PR3 DB ' [ESC] QUIT$'
	PR4 DB '[ESC] BACK TO MENU$' 
	OP1 DB ' [1] EX3 $'	;EX3(OPTION)
	OP2	DB ' [2] EX4	$'	;EX4(OPTION)
	OP3	DB ' [3] EX5	$'	;EX4(OPTION)
	OP4	DB ' [4] EXIT $'	;EXIT
	CHR DB 0	;MENU CHARACTER
	NW DB 0DH,0AH,'$'	;NEWLINE CHARCTER
	CO DB 00000000B	;CHARACTER'S COLOR
	TMP DB 2 DUP (' ')
	UROW DB 0	;UPPER ROW
	UCOL DB 0	;UPPER COLUMN
	DROW DB 24	;LOWER ROW
	DCOL DB 79	;LOWER COLUMN
	TIME DW 0
	NUM DW 0
	GRID DB '*$'
	LOAD DB 'LOADING...$'
	BLK DB 219, '$'
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	LN DB 'LIM$'	;EX3
	FN DB 'JASMIN$'
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	ROW DB 0	;EX4
	COL DB 0
	LET DB 41H
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	S1 DB 'ENTER STRING: $'	;EX5
	S2 DB 'OUTPUT: $'
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
	MOV CO,00001111B
	CALL CLS
	
	MOV ROW,15
	MOV UROW,15
	MOV DROW,15
	MOV COL,6
	MOV UCOL,0
	MOV DCOL,79
	MOV CO,00001100B
	CALL DSG
	MOV CX,30
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
	MOV COL,6
	MOV CO,00001001B
	CALL DSG
	MOV CX,30
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
	MOV COL,6
	MOV CO,00001010B
	CALL DSG
	MOV CX,30
	MOV TIME,1
SHWOP3:	
	CALL SCP 
	MOV DX,OFFSET OP3
	CALL DSPS
	INC COL
	CALL DLY
	LOOP SHWOP3
	
	MOV ROW,11
	MOV COL,27
	MOV UROW,11
	MOV UCOL,0
	MOV DROW,11
	MOV DCOL,79
	MOV CO,00001111B
	CALL DSG
	MOV CX,26
	MOV TIME,1
SHWGRIDRIGHT:
	CALL SCP
	MOV DX,OFFSET GRID
	CALL DSPS
	INC COL
	CALL DLY
	LOOP SHWGRIDRIGHT
	
	MOV UROW,0
	MOV UCOL,53
	MOV DROW,24
	MOV DCOL,53
	CALL DSG
	MOV CX,8
	MOV TIME,1
SHWGRIDRDOWN:
	CALL SCP
	MOV DX,OFFSET GRID
	CALL DSPS
	INC ROW
	CALL DLY
	LOOP SHWGRIDRDOWN
	
	MOV UROW,19
	MOV UCOL,0
	MOV DROW,19
	MOV DCOL,79
	MOV CO,00001111B
	CALL DSG
	MOV CX,27
	MOV TIME,1
SHWGRIDLEFT:
	CALL SCP
	MOV DX,OFFSET GRID
	CALL DSPS
	DEC COL
	CALL DLY
	LOOP SHWGRIDLEFT
	
	MOV UROW,0
	MOV UCOL,26
	MOV DROW,24
	MOV DCOL,26
	CALL DSG
	MOV CX,8
	MOV TIME,1
SHWGRIDRUP:
	CALL SCP
	MOV DX,OFFSET GRID
	CALL DSPS
	DEC ROW
	CALL DLY
	LOOP SHWGRIDRUP

;DROID	LEFT
	MOV ROW,12
	MOV COL,12
	CALL SCP
	MOV CO,10001111B
	MOV CHR,219
	MOV NUM,1
	CALL DSPC
	MOV ROW,12
	MOV COL,16
	CALL SCP
	CALL DSPC
	
	;1ST COL
	MOV UROW,13
	MOV UCOL,9
	MOV DROW,15
	MOV DCOL,9
	MOV CO,00100000B
	CALL DSG
	
	;2ND COL
	MOV UROW,12
	MOV UCOL,10
	MOV DROW,13
	MOV DCOL,10
	CALL DSG
	
	;3RD COL
	MOV UROW,11
	MOV UCOL,11
	MOV DROW,15
	MOV DCOL,11
	CALL DSG
	MOV UROW,9
	MOV DROW,9
	CALL DSG
	
	;4TH COL
	MOV UROW,10
	MOV UCOL,12
	MOV DROW,11
	MOV DCOL,12
	CALL DSG
	MOV UROW,13
	MOV DROW,14
	CALL DSG
	MOV UROW,16
	MOV DROW,16
	CALL DSG
	
	;5TH COL
	MOV UROW,11
	INC UCOL
	MOV DROW,14
	INC DCOL
	CALL DSG
	MOV UROW,16
	MOV DROW,16
	CALL DSG
	
	;6TH COL
	MOV UROW,11
	INC UCOL
	MOV DROW,14
	INC DCOL
	CALL DSG
	
	;7TH COL
	MOV UROW,11
	INC UCOL
	MOV DROW,14
	INC DCOL
	CALL DSG
	MOV UROW,16
	MOV DROW,16
	CALL DSG
	
	;8TH COL
	MOV UROW,10
	INC UCOL
	MOV DROW,11
	INC DCOL
	CALL DSG
	MOV UROW,13
	MOV DROW,14
	CALL DSG
	MOV UROW,16
	MOV DROW,16
	CALL DSG
	
	;9TH COL
	MOV UROW,11
	INC UCOL
	MOV DROW,15
	INC DCOL
	CALL DSG
	MOV UROW,9
	MOV DROW,9
	CALL DSG
	
	;10TH COL
	MOV UROW,12
	INC UCOL
	MOV DROW,13
	INC DCOL
	CALL DSG
	
	;11TH COL
	MOV UROW,13
	INC UCOL
	MOV DROW,15
	INC DCOL 
	CALL DSG

;DROID RIGHT
;1ST COL
	MOV ROW,12
	MOV COL,64
	CALL SCP
	MOV CO,10001111B
	MOV CHR,219
	MOV NUM,1
	CALL DSPC
	MOV ROW,12
	MOV COL,68
	CALL SCP
	CALL DSPC
	
	MOV UROW,13
	MOV UCOL,61
	MOV DROW,15
	MOV DCOL,61
	MOV CO,00100000B
	CALL DSG
	
	;2ND COL
	MOV UROW,12
	INC UCOL
	MOV DROW,13
	INC DCOL
	CALL DSG
	
	;3RD COL
	MOV UROW,11
	INC UCOL
	MOV DROW,15
	INC DCOL
	CALL DSG
	MOV UROW,9
	MOV DROW,9
	CALL DSG
	
	;4TH COL
	MOV UROW,10
	INC UCOL
	MOV DROW,11
	INC DCOL
	CALL DSG
	MOV UROW,13
	MOV DROW,14
	CALL DSG
	MOV UROW,16
	MOV DROW,16
	CALL DSG
	
	;5TH COL
	MOV UROW,11
	INC UCOL
	MOV DROW,14
	INC DCOL
	CALL DSG
	MOV UROW,16
	MOV DROW,16
	CALL DSG
	
	;6TH COL
	MOV UROW,11
	INC UCOL
	MOV DROW,14
	INC DCOL
	CALL DSG
	
	;7TH COL
	MOV UROW,11
	INC UCOL
	MOV DROW,14
	INC DCOL
	CALL DSG
	MOV UROW,16
	MOV DROW,16
	CALL DSG
	
	;8TH COL
	MOV UROW,10
	INC UCOL
	MOV DROW,11
	INC DCOL
	CALL DSG
	MOV UROW,13
	MOV DROW,14
	CALL DSG
	MOV UROW,16
	MOV DROW,16
	CALL DSG
	
	;9TH COL
	MOV UROW,11
	INC UCOL
	MOV DROW,15
	INC DCOL
	CALL DSG
	MOV UROW,9
	MOV DROW,9
	CALL DSG
	
	;10TH COL
	MOV UROW,12
	INC UCOL
	MOV DROW,13
	INC DCOL
	CALL DSG
	
	;11TH COL
	MOV UROW,13
	INC UCOL
	MOV DROW,15
	INC DCOL 
	CALL DSG
;ASSEMBLY////////////////////////////////////////////
	
	;A
	MOV UROW,1
	MOV UCOL,9
	MOV DROW,4
	MOV DCOL,9
	MOV CO,00110000B
	CALL DSG
	MOV UROW,0
	MOV UCOL,10
	MOV DROW,0
	MOV DCOL,10
	CALL DSG
	MOV UROW,2
	MOV DROW,2
	CALL DSG
	MOV UROW,1
	MOV UCOL,11
	MOV DROW,4
	MOV DCOL,11
	CALL DSG
	
	;S
	MOV UROW,0
	MOV UCOL,13
	MOV DROW,0
	MOV DCOL,15
	CALL DSG
	MOV UROW,1
	MOV UCOL,13
	MOV DROW,2
	MOV DCOL,13
	CALL DSG
	MOV UROW,2
	MOV UCOL,14
	MOV DROW,2
	MOV DCOL,15
	CALL DSG
	MOV UROW,3
	MOV UCOL,15
	MOV DROW,4
	MOV DCOL,15
	CALL DSG
	MOV UROW,4
	MOV UCOL,13
	MOV DROW,4
	MOV DCOL,15
	CALL DSG
	
	;S
	MOV UROW,0
	MOV UCOL,17
	MOV DROW,0
	MOV DCOL,19
	CALL DSG
	MOV UROW,1
	MOV UCOL,17
	MOV DROW,2
	MOV DCOL,17
	CALL DSG
	MOV UROW,2
	MOV UCOL,18
	MOV DROW,2
	MOV DCOL,19
	CALL DSG
	MOV UROW,3
	MOV UCOL,19
	MOV DROW,4
	MOV DCOL,19
	CALL DSG
	MOV UROW,4
	MOV UCOL,17
	MOV DROW,4
	MOV DCOL,19
	CALL DSG
	
	;E
	MOV UROW,0
	MOV UCOL,21
	MOV DROW,4
	MOV DCOL,21
	CALL DSG
	MOV UROW,0
	MOV UCOL,22
	MOV DROW,0
	MOV DCOL,23
	CALL DSG
	MOV UROW,2
	MOV UCOL,22
	MOV DROW,2
	MOV DCOL,22
	CALL DSG
	MOV UROW,4
	MOV UCOL,22
	MOV DROW,4
	MOV DCOL,23
	CALL DSG
	
	;M
	MOV UROW,0
	MOV UCOL,25
	MOV DROW,4
	MOV DCOL,25
	CALL DSG
	MOV UROW,1
	MOV UCOL,26
	MOV DROW,1
	MOV DCOL,26
	CALL DSG
	MOV UROW,2
	MOV UCOL,27
	MOV DROW,2
	MOV DCOL,27
	CALL DSG
	MOV UROW,1
	MOV UCOL,28
	MOV DROW,1
	MOV DCOL,28
	CALL DSG
	MOV UROW,0
	MOV UCOL,29
	MOV DROW,4
	MOV DCOL,29
	CALL DSG
	
	;B
	MOV UROW,0
	MOV UCOL,31
	MOV DROW,4
	MOV DCOL,31
	CALL DSG
	MOV UROW,0
	MOV UCOL,32
	MOV DROW,0
	MOV DCOL,33
	CALL DSG
	MOV UROW,1
	MOV UCOL,33
	MOV DROW,1
	MOV DCOL,33
	CALL DSG
	MOV UROW,2
	MOV UCOL,32
	MOV DROW,2
	MOV DCOL,34
	CALL DSG
	MOV UROW,3
	MOV UCOL,34
	MOV DROW,3
	MOV DCOL,34
	CALL DSG
	MOV UROW,4
	MOV UCOL,32
	MOV DROW,4
	MOV DCOL,34
	CALL DSG
	
	;L
	MOV UROW,0
	MOV UCOL,36
	MOV DROW,4
	MOV DCOL,36
	CALL DSG
	MOV UROW,4
	MOV UCOL,36
	MOV DROW,4
	MOV DCOL,37
	CALL DSG
	
	;Y
	MOV UROW,0
	MOV UCOL,40
	MOV DROW,1
	MOV DCOL,40
	CALL DSG
	MOV UROW,2
	MOV UCOL,41
	MOV DROW,4
	MOV DCOL,41
	CALL DSG
	MOV UROW,0
	MOV UCOL,42
	MOV DROW,1
	MOV DCOL,42
	CALL DSG
	
	;-
	MOV UROW,2
	MOV UCOL,49
	MOV DROW,2
	MOV DCOL,57
	CALL DSG
	
	;1
	MOV UROW,0
	MOV UCOL,64
	MOV DROW,4
	MOV DCOL,64
	CALL DSG
	
	;0
	MOV UROW,0
	MOV UCOL,66
	MOV DROW,0
	MOV DCOL,68
	CALL DSG
	MOV UROW,4
	MOV UCOL,66
	MOV DROW,4
	MOV DCOL,68
	CALL DSG
	MOV UROW,1
	MOV UCOL,66
	MOV DROW,3
	MOV DCOL,66
	CALL DSG
	MOV UROW,1
	MOV UCOL,68
	MOV DROW,3
	MOV DCOL,68
	CALL DSG
	
	;1
	MOV UROW,0
	MOV UCOL,71
	MOV DROW,4
	MOV DCOL,71
	CALL DSG
;//////////////////////////////////////////////////////	
	MOV UROW,6
	MOV UCOL,7
	MOV DROW,6
	MOV DCOL,73
	MOV CO,01010000B
	CALL DSG
	
	;LOAD
	MOV ROW,13
	MOV COL,29
	CALL SCP
	MOV DX,OFFSET PR1
	CALL DSPS
	
	;COMMANDS
	MOV ROW,24
	MOV COL,54
	CALL SCP
	MOV DX,OFFSET PR2
	CALL DSPS
	
	;MENU CURSOR	
	MOV ROW,15
	MOV DH,ROW
	MOV COL,35
	MOV DL,COL
	MOV CHR,3EH
	MOV CO,10001111B
	MOV NUM,1
	CALL SCP
	CALL DSPC
CURSOR:		
	MOV AH,0
	INT 16H
	CMP AH,1CH
		JE ENTCURSOR
	CMP AH,50H
		JE DWNCURSOR
	CMP AH,48H
		JE UPCURSOR
	CMP AH,1
		JE EXT
	JMP CURSOR
EXT:RET

DWNCURSOR:
	CMP ROW,15
		JE STPDWN
	CMP ROW,16
		JE STPDWN
	JMP CURSOR
STPDWN:
	MOV UROW,DH
	MOV UCOL,DL
	MOV DROW,DH
	MOV DCOL,DL
	MOV CO,10001111B
	CALL DSG
	INC ROW
	CALL SCP
	CALL DSPC
	JMP CURSOR
	
ENTCURSOR:
	CMP ROW,15
		JE TH
	CMP ROW,16
		JE FO
	CMP ROW,17
		JE FI

UPCURSOR:
	CMP ROW,16
		JE STPUP
	CMP ROW,17
		JE STPUP
	JMP CURSOR
STPUP:
	MOV UROW,DH
	MOV UCOL,DL
	MOV DROW,DH
	MOV DCOL,DL
	MOV CO,10001111B
	CALL DSG
	DEC ROW
	CALL SCP
	CALL DSPC
	JMP CURSOR

	
TH:	CALL LDG
	MOV CO,00001111B
	CALL CLS
	CALL THREE
	JMP RPT
	
FO: CALL LDG
	MOV CO,00001111B
	CALL CLS
	CALL FOUR
	JMP ENTRY

FI:	CALL LDG
	MOV CO,00001111B
	CALL CLS
	CALL FIVE
	
RPT:CALL ENT
	RET
MENU	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

THREE	PROC	;EX3
	MOV AH,6	;CLEAR SCREEN
	MOV AL,0
	MOV BH,00000111B
	MOV CH,0
	MOV CL,00
	MOV DH,24
	MOV DL,79
	INT 10H
	
	CALL BACK
	
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
	MOV BH,10010000B
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
	MOV BH,10010000B
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

FOUR	PROC	;EX4
	MOV CO,00100000B
H:	CALL CLS
	CALL BACK
	
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

E:	RET
FOUR	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

FIVE	PROC	;EX5
		MOV UROW,5
		MOV UCOL,9
		MOV DROW,19
		MOV DCOL,37
		MOV CO,01110110B
		CALL DSG
		
		MOV ROW,4
		MOV COL,21
		CALL SCP
		MOV CHR,219
		MOV CO,10000100B
		MOV NUM,5
		CALL DSPC
		
		DEC ROW
		CALL SCP
		CALL DSPC
		
		DEC ROW
		INC COL
		CALL SCP
		SUB NUM,2
		CALL DSPC
		
		DEC ROW
		INC COL
		CALL SCP
		DEC NUM
		CALL DSPC
		
		MOV UROW,3
		MOV UCOL,23
		MOV DROW,4
		MOV DCOL,23
		MOV CO,01100110B
		CALL DSG
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		MOV UROW,5
		MOV UCOL,41
		MOV DROW,19
		MOV DCOL,69
		MOV CO,01110110B
		CALL DSG
		
		MOV ROW,4
		MOV COL,53
		CALL SCP
		MOV CHR,219
		MOV CO,10000100B
		MOV NUM,5
		CALL DSPC
		
		DEC ROW
		CALL SCP
		CALL DSPC
		
		DEC ROW
		INC COL
		CALL SCP
		SUB NUM,2
		CALL DSPC
		
		DEC ROW
		INC COL
		CALL SCP
		DEC NUM
		CALL DSPC
		
		MOV UROW,3
		MOV UCOL,55
		MOV DROW,4
		MOV DCOL,55
		MOV CO,01100110B
		CALL DSG
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
		MOV ROW,10
		MOV COL,12
		CALL SCP
		
		MOV AH,9
		MOV DX,OFFSET S1	;PROMPT THE USER TO ENTER STRING
		INT 21H
		
		ADD ROW,2
		CALL SCP
		
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
		
		MOV ROW,10
		MOV COL,45
		CALL SCP
		
		MOV AH,9
		MOV DX,OFFSET S2
		INT 21H
		
		ADD ROW,2
		CALL SCP
		
		MOV AH,9
		MOV DX,OFFSET TEMP	;DISPLAY STRING
		INT 21H
		
		CALL BACK
		
		RET
FIVE	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;EXERCISE 4
DSP PROC	;DISPLAY CHARACTER
	CALL SCP
	MOV AH,2
	MOV DL,LET
	INT 21H
	RET
DSP ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CLS	PROC	;CLEAR SCREEN
	MOV AH,6
	MOV AL,0
	MOV BH,CO
	MOV CH,0
	MOV CL,0
	MOV DH,24
	MOV DL,79
	INT 10H
	RET
CLS	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SCP	PROC	;POSITION
	MOV AH,2
	MOV BH,0
	MOV DH,ROW
	MOV DL,COL
	INT 10H
	RET
SCP	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TER	PROC
	MOV AH,4CH
	INT 21H
	RET
TER ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NL	PROC
	MOV AH,9
	MOV DX,OFFSET NW
	INT 21H
	RET
NL	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ENT	PROC	;ESC KEY TO GO BACK TO MENU
NO:	MOV AH,0
	INT 16H
	CMP AH,1
		JE MNU2
	CMP AH,1CH
		JE NO
	JMP NO
MNU2:
	CALL MENU
	RET
ENT	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DSPC	PROC	;DISPLAY CHACTER IN MENU
	MOV AH,9
	MOV AL,CHR
	MOV BH,0
	MOV BL,CO
	MOV CX,NUM
	INT 10H
	RET
DSPC	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DSPS	PROC	;DISPLAY MOVING STRING
	MOV AH,9
	INT 21H
	RET
DSPS	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BACK	PROC
	MOV ROW,23
	MOV COL,60
	CALL SCP
	MOV DX,OFFSET PR4
	CALL DSPS
	RET
BACK 	ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LDG	PROC
	MOV CO,00011111B
	CALL CLS
	
	MOV ROW,17
	MOV COL,34
	CALL SCP
	MOV DX,OFFSET LOAD
	CALL DSPS
	
	MOV ROW,19
	MOV COL,14
	MOV CX,25
	MOV TIME,3
LDAGAIN:
	CALL SCP
	MOV DX,OFFSET BLK
	CALL DSPS
	ADD COL,2
	CALL DLY
	LOOP LDAGAIN
	RET
LDG	ENDP

END M
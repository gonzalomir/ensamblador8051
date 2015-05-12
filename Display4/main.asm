	org 0h
	mov 30h,#2
	mov 31h,#3
	mov 32h,#8
	mov 33h,#7
inicio:	mov R3,#1	;digito
	mov R0,#30h	;indice
loop:	mov DPTR,#digito
	mov A,@R0
	movc A,@A+DPTR
	mov P2,R3
	mov P1,A
	call retardo
	inc R0
	mov A,R3
	rl A
	mov R3,A
	cjne R0,#34h,loop
	sjmp inicio

retardo:mov R6,#1
delay1: mov R7,#249
delay2: djnz R7,delay2
	djnz R6,delay1
	ret
	  ;.abcdefg
digito: db 00111110B ;0
	db 00110000B ;1
	db 01101101B ;2
	db 01111001B ;3
	db 00110011B ;4
	db 01011011B ;5
	db 01111111B ;6
	db 01110000B ;7
	db 01111111B ;8
	db 01111011B ;9
	
	end
	
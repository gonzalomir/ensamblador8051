num equ 30h

	org 0h

inicio:	mov num,#234
	mov R4,1
loop:	call descomponer
	call cargarDigito	
mostrarD0:
	mov P2,#255;
	mov P0,6Fh
	mov P2,#07h
	call retardo
mostrarD1:
	mov P2,#255;
	mov P0,6Eh
	mov P2,#0Bh
        call retardo
mostrarD2:
	mov P2,#255;
	mov P0,6Dh
	mov P2,#0Dh
	call retardo
	
	djnz R4,  mostrarD0
	mov a,num
	inc a
	xch a,num
	sjmp loop
	
cargarDigito:
	mov R2,#3
	mov R0,#7Fh
	mov R1,#6Fh
loopdigito:
	mov dptr,#digito
	mov a,@R0
	movc a,@a+dptr
	cpl a
	mov @R1,a
	dec R0
	dec R1
	djnz R2,loopdigito
	ret
	
descomponer:
	mov 7dh,#0
	mov 7eh,#0
	mov 7fh,#0
	mov R0, #7Fh
	mov 31h,num
loop_des:
	mov a,num
	mov b,#10
	div ab
	mov R6,a	;variable auxiliar R6 <-- A/B
	mov b,#10
	mul ab		;A <-- A*10
	xch a,num
	subb a,num
	mov @R0,a	;Guarda el valor de a en la direccion que apunta R0
	dec R0		;Decrementa el puntero
	mov num,R6
	mov a,R6
	jnz loop_des
	mov num,31h
	ret
	
retardo:mov R5, #2
del1: 	mov R6, #250
del2: 	djnz R6, del2 
	djnz R5, del1
      	ret	
	
digito:	db 01111110b;0
	db 00110000b;1
	db 01101101b;2
	db 01111001b;3
	db 00110011b;4
	db 01011011b;5
	db 01011111b;6
	db 01110000b;7
	db 01111111b;8
	db 01111011b;9
	db 01110111b;A
	db 00011111b;B
	db 01001110b;C
	db 00111101b;D
	db 01001111b;E
	db 01000111b;F	
	end
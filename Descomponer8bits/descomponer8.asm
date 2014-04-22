num equ 30h
	
	org 0h
	
inicio:	mov num, #245
	mov R0,#7Fh	;Puntero de memoria que apunta a 7F

loop:	mov a,num
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
	jnz loop
	nop
	sjmp inicio
	end
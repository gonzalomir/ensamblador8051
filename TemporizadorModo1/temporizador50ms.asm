	org 00h
	sjmp inicio
	org 0Bh
	;Timer0
	call uDisplay

inicio: 

	mov tmod,#00000001b
	mov ie,#10000010b

	mov TH0,#00 ;#60
	mov TL0,#16;#176

	setb tcon.4
loop:	mov a,#89
	nop
	nop
	nop
	
	sjmp loop
	
uDisplay:
	nop
	mov a,#86
	nop
	clr tf0
	reti
	end
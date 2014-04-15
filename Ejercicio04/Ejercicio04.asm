led_azul equ P0.0
led_rojo equ P0.1
boton1 equ P3.2
boton2 equ P3.3

	org 0h
	sjmp inicio
	org 3h	;Interrupcion 0
	setb led_azul
	reti
	
	org 13h	;Interrupcion 1
	setb led_rojo
	reti
	
inicio:	setb ie.0
	setb ie.2
	setb ie.7
loop:	clr led_azul
	clr led_rojo
	nop
	sjmp loop
	end
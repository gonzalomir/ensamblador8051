mensajes equ 400h
mensaje2 equ 500h
rs equ P2.0
en equ P2.1
bus equ P0
func_set_8 equ 30h
func_set_4 equ 20h
fun_set_4x2 equ 28h
clear_lcd equ 01h
display_off equ 08h
entry_mode_set equ 04h
ir equ 0h
dr equ 1h
	org 0h
	mov r3,#180 ;Espera 15ms
	call delay  ;Espera 15ms
	mov r5,ir
	mov a,func_set_8
	call carga_lcd
	mov r3,#92  ;Espera 4.1ms
	call delay  ;Espera 4.1ms
	mov a,func_set_8
	call carga_lcd
	
	
Leer_msg:
;Verificar si la tecla oprimida es >=A8
	jb acc.3, grupo2
	mov dptr, #400H
	sjmp multi
grupo2: mov dptr, #500H
	subb a,#8
multi:	mov b,#20h
	mul ab
de_nuevo:
	mov r2,A ;Respalda el valor de A
	mov r3, 20h
	
;Leer caracter del mensaje
	movc a,@a+dptr
	setb c
	lcall carga_lcd
	mov r1,#01
	lcall delay
	dec r3
	cjne r3,#10h,fin_lin2

;Cambio a la linea 2 del LCD
	mov a,#0C0h
	clr c
	lcall carga_lcd
	mov r1,#01
	lcall delay
	mov a,r2
	inc a
	sjmp de_nuevo
fin_lin2:
	cjne r3,#20,sig_chr
	;sjmp otro
	ret

carga_lcd:
	clr en
	mov rs,c
	setb en
	mov bus,a
	clr en
	swap a
	setb en
	mov bus,a
	clr en
	ret

;Subrutina espera
delay:	mov r2,#23
aqui:	djnz r2,aqui
	djnz r3,delay
	ret

	org mensajes
	db "Mensaje 1"
	db "Mensaje 2"
	db "Mensaje 3"
	
	org mensaje2
	db "Mensaje 4"
	db "Mensaje 5"
	db "Mensaje 6"
	
	end
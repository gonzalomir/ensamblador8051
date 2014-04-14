	org 0h		
inicio: mov R0, #0	;inicializar en cero R0
loop:	mov dptr, #digito	;mueve a A el contenido de R0
	mov A, R0
	movc A, @A+dptr
	inc R0
	mov P0,A
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	call retardo
	cjne R0,#16,loop
	sjmp inicio
; ============================================= 
; 	subrutina de retardo
; ============================================= 
retardo:mov R1, #250
del1: 	mov R2, #250
del2: 	djnz R2, del2 
	djnz R1, del1
      	ret
      	  ;.abcdefg
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
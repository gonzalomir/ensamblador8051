        org 0h 
inicio: mov R0, #0	;inicializar en cero R0
loop:	mov A, R0	;mueve a A el contenido de R0
	cpl A		;complemento a A
	mov P0, A	;mueve al puerto 0 el valor del registro 0
	call retardo	;llama al retardo
        inc R0		;incrementar R0
        jb psw.2, inicio;saltar si se desborda R0
        sjmp loop	;saltar al loop
; ============================================= 
; 	subrutina de retardo
; ============================================= 
retardo:mov R1, #249 
del1: 	mov R2, #249
del2: 	djnz R2, del2 
	djnz R1, del1 
      	ret 
end
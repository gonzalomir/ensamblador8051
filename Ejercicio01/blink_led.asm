        org 0h 
inicio: clr P0.0	;enviar '0' al pin P0.0 
        call retardo	;llamar al retardo 
        setb P0.0	;enviar '1' al pin P0.0 
        call retardo	;llamar al retardo 
        sjmp inicio	;loop volver a inicio
; ============================================= 
; 	subrutina de retardo
; ============================================= 
retardo:mov R1, #249 
del1: 	mov R2, #249
del2: 	djnz R2, del2 
	djnz R1, del1 
      	ret 
end
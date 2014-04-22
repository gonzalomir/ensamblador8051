xl equ 30h
xh equ 31h
yl equ 32h
yh equ 33h
zl equ 34h
zh equ 35h
n equ 36h
digito1 equ 37h
digito2 equ 38h
digito3 equ 39h
digito4 equ 40h

	org 0h
	
inicio:	mov n,#20  ;20 Numeros hasta 4 digitos
	mov xl,#255;Carga la parte baja de X
	mov xh,#255;Carga la parte alta de X
	
	mov yl,#1  ;Carga la parte baja de Y
	mov yh,#0  ;Carga la parte alta de y

loop:	call suma16;Suma x+y

	mov A,yl   ;Mueve la parte baja de Y a X
	mov xl,A   
	mov A,yh   ;Mueve la parte alta de Y a X
	mov xh,A

	mov A,zl   ;Mueve la parte baja de Z a Y
	mov yl,A
	mov A,zh   ;Mueve la parte alta de Z a Y
	mov yh,A
	
	djnz n,loop
	sjmp inicio	
	
suma16:	mov A,xl   ;Mueve la parte baja de X a A
	add A,yl   ;Suma la parte baja de Y con X
	mov zl,A   ;Mueve a la parte baja de Z el contenido de A
	mov A,xh   ;Mueve la parte alta de X a A
	addc A,yh  ;Suma la parte alta de Y con X + el acarreo
	mov zh,A   ;Mueve a la parte alta de Z el contenido de A
	ret
		
	end
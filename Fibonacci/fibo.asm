      n equ R3

	org 0h
inicio:	mov n,#10
	mov R0, #-1
	mov R1, #1
loop:	mov A,R0
	add A,R1
	mov R2,A
	mov P0, R2
	mov A,R1
	mov R0,A
	mov A,R2
	mov R1,A
	djnz n,loop
	sjmp inicio	
	end
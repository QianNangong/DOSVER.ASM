section .text
start:
	org		0x100
	push	ds
	pop		es
	mov		dx, prefix_str
	mov 	ax, 0900h
	int		21h
	mov		ax, 3000h
	int		21h
	mov		bx, ax
	cmp		bl, 00h
	jnz 	print_version
	mov		bl, 01h
print_version:
	mov		al, bl
	xor		ah, ah
	mov		dl, 0ah
	div		dl
	mov		cx, ax
	mov		dl, cl
	cmp		dl, 0
	jz		print_major_1
	add		dl, 30h
	mov		ax, 0200h
	int 	21h
print_major_1:
	mov		dl, ch
	add 	dl, 30h
	mov		ax, 0200h
	int 	21h
	mov		dl, 2eh
	mov		ax, 0200h
	int 	21h
	mov		al, bh
	xor		ah, ah
	mov		dl, 0ah
	div		dl
	mov		bx, ax
	mov		dl, bl
	add		dl, 30h
	mov		ax, 0200h
	int 	21h
	mov		dl, bh
	add 	dl, 30h
	mov		ax, 0200h
	int 	21h
	pop		ax
	mov		ax, 4c00h
	int		21h

section .data
	prefix_str db 'DOS Compatible Version: $'
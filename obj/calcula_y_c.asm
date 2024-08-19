;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module calcula_y_c
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _calcula_y_c
	.globl _printf
	.globl _y_m
	.globl _y_f
	.globl _y
	.globl _new_pvmem
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_new_pvmem::
	.ds 2
_y::
	.ds 1
_y_f::
	.ds 1
_y_m::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/calcula_y_c.c:9: void calcula_y_c(){
;	---------------------------------
; Function calcula_y_c
; ---------------------------------
_calcula_y_c::
;src/calcula_y_c.c:12: new_pvmem=pvmem - 0xc000;
	ld	hl, #_new_pvmem
	ld	iy, #_pvmem
	ld	a, 0 (iy)
	add	a, #0x00
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x40
	inc	hl
	ld	(hl), a
;src/calcula_y_c.c:13: y=  (new_pvmem/80);
	ld	hl, #0x0050
	push	hl
	ld	hl, (_new_pvmem)
	push	hl
	call	__divuint
	pop	af
	pop	af
	ld	iy, #_y
	ld	0 (iy), l
;src/calcula_y_c.c:14: y_m = y *8;
	ld	a, 0 (iy)
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	(#_y_m + 0),a
;src/calcula_y_c.c:15: y_f = y/8;
	ld	a,(#_y + 0)
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	(#_y_f + 0),a
;src/calcula_y_c.c:16: printf("PVMEM %X,Despl%X\n",pvmem,new_pvmem);
	ld	hl, (_new_pvmem)
	push	hl
	ld	hl, (_pvmem)
	push	hl
	ld	hl, #___str_0
	push	hl
	call	_printf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/calcula_y_c.c:17: printf("INT Y=%d,ROW Y=%d",y_m,y);
	ld	hl,#_y + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	hl,#_y_m + 0
	ld	c, (hl)
	ld	b, #0x00
	push	de
	push	bc
	ld	hl, #___str_1
	push	hl
	call	_printf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	ret
___str_0:
	.ascii "PVMEM %X,Despl%X"
	.db 0x0a
	.db 0x00
___str_1:
	.ascii "INT Y=%d,ROW Y=%d"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

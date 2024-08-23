_calcula_y::
    ld hl,(_pvmem)    ;;direccion original
    ld de,#0xc000     ;;restamos origen inicio pantalla
    sbc hl,de         ;;guardamos
    ld (_pvmem),hl
    ld a,#0
    ld (y),a 
    ld (y_l),a 
    ld (x),a 
y_LINE::
  ld a,h
  and #0b00111000   ;;
  ld h,a
    rrca
    rrca
    rrca
     ld (y_l),a
    ld c,a
  ld hl,(_pvmem)
  ld a,h
  and #0b00000111
  ld h,a
  ld (_pvmem),hl
y_ROW::
;;0b 0000 0RRR RRRR 0000
  ld hl,(_pvmem)
 loop_h:
    ld a,h
    or a
      jr z,fin_h
 loop_l:
    ld a,l
    sub #0x50
    ld l,a
    ld a,h
    sbc a,#0
    ld h,a 
    ld a,(y)
    inc a 
    ld (y),a
  jr loop_h
fin_h:
  ;;ld a,l 
  ;;or a 
  ;;  jr z,fin_l
  ld a,l
  sub #0x50
    jr c,calcula_x
  jr loop_l
calcula_x::
  ld a,(y)  ;;ultima ROW
  rlca      ;;multiplicamos por 8
  rlca
  rlca
  add c     ;;y sumamos
  ld c,a    ;;carga en C la posicion Y
  ;;0B 0000 0000 0001 1111
  ld a,l
  and #0b00011111
  ld (x),a
  ld b,a
fin_l:
jr .
ret
y:: .db 0
y_l:: .db 0
x:: .db 0
_pvmem:: .dw 0xdead

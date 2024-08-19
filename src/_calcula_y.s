_calcula_y::
    ld hl,#0xc780   ;;direccion original,ejemplo. es 10 ROW,LINE 4
    ld de,#0xc000
    sbc hl,de        ;;restamos origen inicio pantalla
    ld a,#0
    ld (y),a 
    ld (y_l),a  
y_LINE::
  ld a,l
  and #0b1111000
    rrca
    rrca
    rrca
     ld (y_l),a
    ld c,a
y_ROW::
  ld hl,(_pvmem)
  ld de,#0xc000
  sbc hl,de
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
  ld a,l 
  or a 
    jr z,fin_l
  jr loop_l
fin_l:
jr .
ret
y: .db 0
y_l: .db 0
siguiente_linea:: .dw 0x0800
siguiente_caracter:: .dw 0x0050
temp_hl:: .dw 0xdead
_pvmem:: .dw 0xc780
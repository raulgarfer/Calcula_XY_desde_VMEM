_calcula_y::
;;0b PPLL LRRR RRRR+X XXXX
;;P = Pagina de memoria.
;;R = Row (Fila Y [0-24])
;;L = Line (linea [0-7])
;;X = coordenada X [0-79]
    ld hl,(_pvmem)    ;;direccion original
    ld de,#0xc000     ;;restamos origen inicio pantalla
    sbc hl,de         ;;guardamos
    

    
    ld (_pvmem),hl
    ld a,#0           
  
y_LINE::
  ld a,h      
  and #0b00111000   ;;cogemos los bits 
  ld h,a
    rrca            ;;division  por 8
    rrca
    rrca
    ld c,a
  ld hl,(_pvmem)
  ld a,h            ;;quitamos los bits Y
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
  ld a,l            ;;se calcula la X
  and #0b00011111   ;;cogemos la parte interesante de L
  ld b,a            ;; y guardamos para devolver
fin_l:
jr .
ret

_pvmem:: .dw 0xdead

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



   40A4                       1 _calcula_y::
   40A4 2A 09 41      [16]    2     ld hl,(_pvmem)   ;;direccion original,ejemplo. es 10 ROW,LINE 4
   40A7 11 00 C0      [10]    3     ld de,#0xc000
   40AA ED 52         [15]    4     sbc hl,de        ;;restamos origen inicio pantalla
   40AC 22 09 41      [16]    5     ld (_pvmem),hl
   40AF 3E 00         [ 7]    6     ld a,#0
   40B1 32 00 41      [13]    7     ld (y),a 
   40B4 32 01 41      [13]    8     ld (y_l),a 
   40B7 32 02 41      [13]    9     ld (x),a 
   40BA                      10 y_LINE::
   40BA 7C            [ 4]   11   ld a,h
   40BB E6 38         [ 7]   12   and #0b00111000   ;;
   40BD 67            [ 4]   13   ld h,a
   40BE 0F            [ 4]   14     rrca
   40BF 0F            [ 4]   15     rrca
   40C0 0F            [ 4]   16     rrca
   40C1 32 01 41      [13]   17      ld (y_l),a
   40C4 4F            [ 4]   18     ld c,a
   40C5 2A 09 41      [16]   19   ld hl,(_pvmem)
   40C8 7C            [ 4]   20   ld a,h
   40C9 E6 07         [ 7]   21   and #0b00000111
   40CB 67            [ 4]   22   ld h,a
   40CC 22 09 41      [16]   23   ld (_pvmem),hl
   40CF                      24 y_ROW::
                             25 ;;0b 0000 0RRR RRRR 0000
   40CF 2A 09 41      [16]   26   ld hl,(_pvmem)
   40D2                      27  loop_h:
   40D2 7C            [ 4]   28     ld a,h
   40D3 B7            [ 4]   29     or a
   40D4 28 11         [12]   30       jr z,fin_h
   40D6                      31  loop_l:
   40D6 7D            [ 4]   32     ld a,l
   40D7 D6 50         [ 7]   33     sub #0x50
   40D9 6F            [ 4]   34     ld l,a
   40DA 7C            [ 4]   35     ld a,h
   40DB DE 00         [ 7]   36     sbc a,#0
   40DD 67            [ 4]   37     ld h,a 
   40DE 3A 00 41      [13]   38     ld a,(y)
   40E1 3C            [ 4]   39     inc a 
   40E2 32 00 41      [13]   40     ld (y),a
   40E5 18 EB         [12]   41   jr loop_h
   40E7                      42 fin_h:
                             43   ;;ld a,l 
                             44   ;;or a 
                             45   ;;  jr z,fin_l
   40E7 7D            [ 4]   46   ld a,l
   40E8 D6 50         [ 7]   47   sub #0x50
   40EA 38 02         [12]   48     jr c,calcula_x
   40EC 18 E8         [12]   49   jr loop_l
   40EE                      50 calcula_x::
   40EE 3A 00 41      [13]   51   ld a,(y)  ;;ultima ROW
                             52   ;;inc a     ;;en ROW 0 sumara?
                             53   ;;ld (y),a  ;;si suma, empezar en -1 la (Y)
   40F1 07            [ 4]   54   rlca
   40F2 07            [ 4]   55   rlca
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



   40F3 07            [ 4]   56   rlca
                             57   
   40F4 81            [ 4]   58   add c
   40F5 4F            [ 4]   59   ld c,a    ;;carga en C la posicion Y
                             60   ;;0B 0000 0000 0001 1111
   40F6 7D            [ 4]   61   ld a,l
   40F7 E6 1F         [ 7]   62   and #0b00011111
   40F9 32 02 41      [13]   63   ld (x),a
   40FC 47            [ 4]   64   ld b,a
   40FD                      65 fin_l:
   40FD 18 FE         [12]   66 jr .
   40FF C9            [10]   67 ret
   4100 00                   68 y:: .db 0
   4101 00                   69 y_l:: .db 0
   4102 00                   70 x:: .db 0
   4103 00 08                71 siguiente_linea:: .dw 0x0800
   4105 50 00                72 siguiente_caracter:: .dw 0x0050
   4107 AD DE                73 t_pvmem:: .dw 0xdead
   4109 AA E0                74 _pvmem:: .dw 0xe0aa

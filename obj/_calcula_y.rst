ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



   40A7                       1 _calcula_y::
   40A7 21 80 C7      [10]    2     ld hl,#0xc780   ;;direccion original,ejemplo. es 10 ROW,LINE 4
   40AA 11 00 C0      [10]    3     ld de,#0xc000
   40AD ED 52         [15]    4     sbc hl,de        ;;restamos origen inicio pantalla
   40AF 3E 00         [ 7]    5     ld a,#0
   40B1 32 E7 40      [13]    6     ld (y),a 
   40B4 32 E8 40      [13]    7     ld (y_l),a  
   40B7                       8 y_LINE::
   40B7 7D            [ 4]    9   ld a,l
   40B8 E6 78         [ 7]   10   and #0b1111000
   40BA 0F            [ 4]   11     rrca
   40BB 0F            [ 4]   12     rrca
   40BC 0F            [ 4]   13     rrca
   40BD 32 E8 40      [13]   14      ld (y_l),a
   40C0 4F            [ 4]   15     ld c,a
   40C1                      16 y_ROW::
   40C1 2A EF 40      [16]   17   ld hl,(_pvmem)
   40C4 11 00 C0      [10]   18   ld de,#0xc000
   40C7 ED 52         [15]   19   sbc hl,de
   40C9                      20  loop_h:
   40C9 7C            [ 4]   21     ld a,h
   40CA B7            [ 4]   22     or a
   40CB 28 11         [12]   23       jr z,fin_h
   40CD                      24  loop_l:
   40CD 7D            [ 4]   25     ld a,l
   40CE D6 50         [ 7]   26     sub #0x50
   40D0 6F            [ 4]   27     ld l,a
   40D1 7C            [ 4]   28     ld a,h
   40D2 DE 00         [ 7]   29     sbc a,#0
   40D4 67            [ 4]   30     ld h,a 
   40D5 3A E7 40      [13]   31     ld a,(y)
   40D8 3C            [ 4]   32     inc a 
   40D9 32 E7 40      [13]   33     ld (y),a
   40DC 18 EB         [12]   34   jr loop_h
   40DE                      35 fin_h:
   40DE 7D            [ 4]   36   ld a,l 
   40DF B7            [ 4]   37   or a 
   40E0 28 02         [12]   38     jr z,fin_l
   40E2 18 E9         [12]   39   jr loop_l
   40E4                      40 fin_l:
   40E4 18 FE         [12]   41 jr .
   40E6 C9            [10]   42 ret
   40E7 00                   43 y: .db 0
   40E8 00                   44 y_l: .db 0
   40E9 00 08                45 siguiente_linea:: .dw 0x0800
   40EB 50 00                46 siguiente_caracter:: .dw 0x0050
   40ED AD DE                47 temp_hl:: .dw 0xdead
   40EF 80 C7                48 _pvmem:: .dw 0xc780

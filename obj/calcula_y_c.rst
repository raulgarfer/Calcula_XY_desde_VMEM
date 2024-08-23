                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module calcula_y_c
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _calcula_y_c
                             12 	.globl _printf
                             13 	.globl _y_m
                             14 	.globl _y_f
                             15 	.globl _y
                             16 	.globl _new_pvmem
                             17 ;--------------------------------------------------------
                             18 ; special function registers
                             19 ;--------------------------------------------------------
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _DATA
   4D0C                      24 _new_pvmem::
   4D0C                      25 	.ds 2
   4D0E                      26 _y::
   4D0E                      27 	.ds 1
   4D0F                      28 _y_f::
   4D0F                      29 	.ds 1
   4D10                      30 _y_m::
   4D10                      31 	.ds 1
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _INITIALIZED
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DABS (ABS)
                             40 ;--------------------------------------------------------
                             41 ; global & static initialisations
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _GSINIT
                             45 	.area _GSFINAL
                             46 	.area _GSINIT
                             47 ;--------------------------------------------------------
                             48 ; Home
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _HOME
                             52 ;--------------------------------------------------------
                             53 ; code
                             54 ;--------------------------------------------------------
                             55 	.area _CODE
                             56 ;src/calcula_y_c.c:9: void calcula_y_c(){
                             57 ;	---------------------------------
                             58 ; Function calcula_y_c
                             59 ; ---------------------------------
   4000                      60 _calcula_y_c::
                             61 ;src/calcula_y_c.c:12: new_pvmem=pvmem - 0xc000;
   4000 21 0C 4D      [10]   62 	ld	hl, #_new_pvmem
   4003 FD 21 09 41   [14]   63 	ld	iy, #_pvmem
   4007 FD 7E 00      [19]   64 	ld	a, 0 (iy)
   400A C6 00         [ 7]   65 	add	a, #0x00
   400C 77            [ 7]   66 	ld	(hl), a
   400D FD 7E 01      [19]   67 	ld	a, 1 (iy)
   4010 CE 40         [ 7]   68 	adc	a, #0x40
   4012 23            [ 6]   69 	inc	hl
   4013 77            [ 7]   70 	ld	(hl), a
                             71 ;src/calcula_y_c.c:13: y=  (new_pvmem/80);
   4014 21 50 00      [10]   72 	ld	hl, #0x0050
   4017 E5            [11]   73 	push	hl
   4018 2A 0C 4D      [16]   74 	ld	hl, (_new_pvmem)
   401B E5            [11]   75 	push	hl
   401C CD 0B 41      [17]   76 	call	__divuint
   401F F1            [10]   77 	pop	af
   4020 F1            [10]   78 	pop	af
   4021 FD 21 0E 4D   [14]   79 	ld	iy, #_y
   4025 FD 75 00      [19]   80 	ld	0 (iy), l
                             81 ;src/calcula_y_c.c:14: y_m = y *8;
   4028 FD 7E 00      [19]   82 	ld	a, 0 (iy)
   402B 07            [ 4]   83 	rlca
   402C 07            [ 4]   84 	rlca
   402D 07            [ 4]   85 	rlca
   402E E6 F8         [ 7]   86 	and	a, #0xf8
   4030 32 10 4D      [13]   87 	ld	(#_y_m + 0),a
                             88 ;src/calcula_y_c.c:15: y_f = y/8;
   4033 3A 0E 4D      [13]   89 	ld	a,(#_y + 0)
   4036 0F            [ 4]   90 	rrca
   4037 0F            [ 4]   91 	rrca
   4038 0F            [ 4]   92 	rrca
   4039 E6 1F         [ 7]   93 	and	a, #0x1f
   403B 32 0F 4D      [13]   94 	ld	(#_y_f + 0),a
                             95 ;src/calcula_y_c.c:16: printf("PVMEM %X,Despl%X\n",pvmem,new_pvmem);
   403E 2A 0C 4D      [16]   96 	ld	hl, (_new_pvmem)
   4041 E5            [11]   97 	push	hl
   4042 2A 09 41      [16]   98 	ld	hl, (_pvmem)
   4045 E5            [11]   99 	push	hl
   4046 21 6D 40      [10]  100 	ld	hl, #___str_0
   4049 E5            [11]  101 	push	hl
   404A CD 79 41      [17]  102 	call	_printf
   404D 21 06 00      [10]  103 	ld	hl, #6
   4050 39            [11]  104 	add	hl, sp
   4051 F9            [ 6]  105 	ld	sp, hl
                            106 ;src/calcula_y_c.c:17: printf("INT Y=%d,ROW Y=%d",y_m,y);
   4052 21 0E 4D      [10]  107 	ld	hl,#_y + 0
   4055 5E            [ 7]  108 	ld	e, (hl)
   4056 16 00         [ 7]  109 	ld	d, #0x00
   4058 21 10 4D      [10]  110 	ld	hl,#_y_m + 0
   405B 4E            [ 7]  111 	ld	c, (hl)
   405C 06 00         [ 7]  112 	ld	b, #0x00
   405E D5            [11]  113 	push	de
   405F C5            [11]  114 	push	bc
   4060 21 7F 40      [10]  115 	ld	hl, #___str_1
   4063 E5            [11]  116 	push	hl
   4064 CD 79 41      [17]  117 	call	_printf
   4067 21 06 00      [10]  118 	ld	hl, #6
   406A 39            [11]  119 	add	hl, sp
   406B F9            [ 6]  120 	ld	sp, hl
   406C C9            [10]  121 	ret
   406D                     122 ___str_0:
   406D 50 56 4D 45 4D 20   123 	.ascii "PVMEM %X,Despl%X"
        25 58 2C 44 65 73
        70 6C 25 58
   407D 0A                  124 	.db 0x0a
   407E 00                  125 	.db 0x00
   407F                     126 ___str_1:
   407F 49 4E 54 20 59 3D   127 	.ascii "INT Y=%d,ROW Y=%d"
        25 64 2C 52 4F 57
        20 59 3D 25 64
   4090 00                  128 	.db 0x00
                            129 	.area _CODE
                            130 	.area _INITIALIZER
                            131 	.area _CABS (ABS)

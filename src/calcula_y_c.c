#include <cpctelera.h> 
#include "stdio.h" 
 extern u16 pvmem;
    u16 new_pvmem;
    u8 y;
    u8 y_f;
    u8 y_m;
 
void calcula_y_c(){
   

    new_pvmem=pvmem - 0xc000;
    y=  (new_pvmem/80);
    y_m = y *8;
    y_f = y/8;
    printf("PVMEM %X,Despl%X\n",pvmem,new_pvmem);
    printf("INT Y=%d,ROW Y=%d",y_m,y);

}
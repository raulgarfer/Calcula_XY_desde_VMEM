//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <cpctelera.h>
extern u8 *pvmem;

void main(void) {
  // u8* pvmem;  // Pointer to video memory
   u8 *pvmem_c;
   u8 x,y; 
   x=20;
   y=30;
   pvmem_c = cpct_getScreenPtr(0xc000,x,y);
   pvmem =  pvmem_c;
   calcula_y();
  
   //cpct_drawStringM1(y,(u8*)pvmem);
   // Loop forever
   while (1);
}

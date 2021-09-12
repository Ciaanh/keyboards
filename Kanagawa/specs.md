1 rot enc
1 oled
85(86) keys


Matrix 6x14 => 84


graphics cu layer => https://github.com/komar007/gh60

1 i2c => 2 pins
1 rot enc => 2 pins + switch
RGB => 1 pin


oled display
128x32   https://fr.farnell.com/midas/mdob128032gv-wi/afficheur-oled-cob-128-x-32-pixels/dp/3407291


``python3 ./generate_pcbs.py``



Elite-C

.   |    |    |    |    |    |    .
----|----|----|----|----|----|-----  
D3  |    |    |    |    |    |  B0
D2  |    |    |    |    |    |  GND
GND |    |    |    |    |    |  RST
GND |    |    |    |    |    |  VCC
D1  |    |    |    |    |    |  F4
D0  |    |    |    |    |    |  F5
D4  |    |    |    |    |    |  F6
C6  |    |    |    |    |    |  F7
D7  |    |    |    |    |    |  B1
E6  |    |    |    |    |    |  B3
B4  |    |    |    |    |    |  B2
B5  | B7 | D5 | C7 | F1 | F0 |  B6

I/O => 24

RP - Pico

.     |       |     |       |     .
------|-------|-----|-------|------  
GP00  |       |     |       |  VBUS
GP01  |       |     |       |  VSYS
GND   |       |     |       |  GND
GP02  |       |     |       |  3V3 EN
GP03  |       |     |       |  3V3 OUT
GP04  |       |     |       |  -
GP05  |       |     |       |  GP28
GND   |       |     |       |  GND
GP06  |       |     |       |  GP27
GP07  |       |     |       |  GP26
GP08  |       |     |       |  RUN
GP09  |       |     |       |  GP22
GND   |       |     |       |  GND
GP10  |       |     |       |  GP21
GP11  |       |     |       |  GP20
GP12  |       |     |       |  GP19
GP13  |       |     |       |  GP18
GND   |       |     |       |  GND
GP14  |       |     |       |  GP17
GP15  | SWCLK | GND | SWDIO |  GP16

I/O => 26
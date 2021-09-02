http://www.keyboard-layout-editor.com/#/gists/16c88de775d4e0aa35cefe443daa3789



Layout
define layout in http://www.keyboard-layout-editor.com/
create svg with http://builder.swillkb.com/
export svg to kicad https://github.com/badgeek/svg2shenzhen
inkscape
import svg in Kicad to place switches

kicad multiple sheets
https://www.re-innovation.co.uk/docs/multiple-sheet-schematics-in-kicad/

https://fr.farnell.com/harwin/m22-2021005/connect-header-20-voies-2-rangs/dp/3395130
https://fr.farnell.com/harwin/m22-7141042/embase-femelle-verticale-dil-10/dp/1109738

French accents
https://www.languedoc121tech.fr/french-accented-characters-qwerty/


Link pins

.   |    |  |    .
----|----|--|-----  
    | 01 |  |     
    | 02 |  |     
    | 03 |  |     
    | 04 |  |     
    | 05 |  |     
    | 06 |  |     
    | 07 |  |     
    | 08 |  |     
    | 09 |  |     
    | 10 |  |     
    | 11 |  |     
    | 12 |  |     





Pin out
Atmega32u4


I2C (oled) 2 pins
led 1 pin
rgb 1 pin
rotary 2 pin + 1 slot switch


6 x 8 => 48

8 x 14 => 112

=> 28 pins for all features



Pro Micro


.   |  |  |  |  |  |    .
----|--|--|--|--|--|-----  
D3  |  |  |  |  |  |  RAW
D2  |  |  |  |  |  |  GND
GND |  |  |  |  |  |  RST
GND |  |  |  |  |  |  VCC
D1  |  |  |  |  |  |  F4
D0  |  |  |  |  |  |  F5
D4  |  |  |  |  |  |  F6
C6  |  |  |  |  |  |  F7
D7  |  |  |  |  |  |  B1
E6  |  |  |  |  |  |  B3
B4  |  |  |  |  |  |  B2
B5  |  |  |  |  |  |  B6

I/O => 18



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
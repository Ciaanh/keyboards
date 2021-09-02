1 rot enc
1 oled
85(86) keys


Matrix 6x15 => 90




1 i2c => 2 pins
1 rot enc => 2 pins + switch
RGB => 1 pin




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
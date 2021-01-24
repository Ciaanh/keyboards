EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L link:Conn_02x10_Counter_Clockwise J0
U 1 1 600BFD0A
P 5200 2300
F 0 "J0" H 5250 2917 50  0000 C CNN
F 1 "Conn_02x10_Counter_Clockwise" H 5250 2826 50  0000 C CNN
F 2 "link:conn_2x10_P2.00mm_Vertical" H 5200 2300 50  0001 C CNN
F 3 "" H 5200 2300 50  0001 C CNN
	1    5200 2300
	1    0    0    -1  
$EndComp
$Comp
L link:Conn_02x10_Counter_Clockwise J1
U 1 1 600C18EA
P 6850 2300
F 0 "J1" H 6900 2917 50  0000 C CNN
F 1 "Conn_02x10_Counter_Clockwise" H 6900 2826 50  0000 C CNN
F 2 "link:conn_2x10_P2.00mm_Vertical" H 6850 2300 50  0001 C CNN
F 3 "" H 6850 2300 50  0001 C CNN
	1    6850 2300
	1    0    0    -1  
$EndComp
Text GLabel 6650 2000 0    50   Input ~ 0
LED
Text GLabel 6650 2100 0    50   Input ~ 0
col0
Text GLabel 6650 2200 0    50   Input ~ 0
col1
Text GLabel 6650 2300 0    50   Input ~ 0
col2
Text GLabel 6650 2400 0    50   Input ~ 0
col3
Text GLabel 6650 2500 0    50   Input ~ 0
col4
Text GLabel 6650 2600 0    50   Input ~ 0
col5
Text GLabel 6650 2700 0    50   Input ~ 0
col6
Text GLabel 6650 2800 0    50   Input ~ 0
col7
Text GLabel 7150 2000 2    50   Input ~ 0
RGB
Text GLabel 7150 2100 2    50   Input ~ 0
SDA
Text GLabel 7150 2200 2    50   Input ~ 0
SCL
Text GLabel 7150 2300 2    50   Input ~ 0
row5
Text GLabel 7150 2400 2    50   Input ~ 0
row4
Text GLabel 7150 2500 2    50   Input ~ 0
row3
Text GLabel 7150 2600 2    50   Input ~ 0
row2
Text GLabel 7150 2700 2    50   Input ~ 0
row1
Text GLabel 7150 2800 2    50   Input ~ 0
row0
$Comp
L link:GND #PWR0101
U 1 1 600C3766
P 7150 1900
F 0 "#PWR0101" H 7150 1650 50  0001 C CNN
F 1 "GND" H 7155 1727 50  0000 C CNN
F 2 "" H 7150 1900 50  0001 C CNN
F 3 "" H 7150 1900 50  0001 C CNN
	1    7150 1900
	0    -1   -1   0   
$EndComp
$Comp
L link:VCC #PWR0102
U 1 1 600C412F
P 6650 1900
F 0 "#PWR0102" H 6650 1750 50  0001 C CNN
F 1 "VCC" H 6667 2073 50  0000 C CNN
F 2 "" H 6650 1900 50  0001 C CNN
F 3 "" H 6650 1900 50  0001 C CNN
	1    6650 1900
	0    -1   -1   0   
$EndComp
Text GLabel 5500 2000 2    50   Input ~ 0
RGB
Text GLabel 5500 2100 2    50   Input ~ 0
SDA
Text GLabel 5500 2200 2    50   Input ~ 0
SCL
Text GLabel 5500 2300 2    50   Input ~ 0
row5
Text GLabel 5500 2400 2    50   Input ~ 0
row4
Text GLabel 5500 2500 2    50   Input ~ 0
row3
Text GLabel 5500 2600 2    50   Input ~ 0
row2
Text GLabel 5500 2700 2    50   Input ~ 0
row1
Text GLabel 5500 2800 2    50   Input ~ 0
row0
$Comp
L link:GND #PWR0103
U 1 1 600C8BB3
P 5500 1900
F 0 "#PWR0103" H 5500 1650 50  0001 C CNN
F 1 "GND" H 5505 1727 50  0000 C CNN
F 2 "" H 5500 1900 50  0001 C CNN
F 3 "" H 5500 1900 50  0001 C CNN
	1    5500 1900
	0    -1   -1   0   
$EndComp
Text GLabel 5000 2000 0    50   Input ~ 0
LED
Text GLabel 5000 2100 0    50   Input ~ 0
col0
Text GLabel 5000 2200 0    50   Input ~ 0
col1
Text GLabel 5000 2300 0    50   Input ~ 0
col2
Text GLabel 5000 2400 0    50   Input ~ 0
col3
Text GLabel 5000 2500 0    50   Input ~ 0
col4
Text GLabel 5000 2600 0    50   Input ~ 0
col5
Text GLabel 5000 2700 0    50   Input ~ 0
col6
Text GLabel 5000 2800 0    50   Input ~ 0
col7
$Comp
L link:VCC #PWR0104
U 1 1 600C952E
P 5000 1900
F 0 "#PWR0104" H 5000 1750 50  0001 C CNN
F 1 "VCC" H 5017 2073 50  0000 C CNN
F 2 "" H 5000 1900 50  0001 C CNN
F 3 "" H 5000 1900 50  0001 C CNN
	1    5000 1900
	0    -1   -1   0   
$EndComp
$Comp
L link:GND_FLAG #PWR0105
U 1 1 600CD269
P 6250 1250
F 0 "#PWR0105" H 6250 1050 50  0001 C CNN
F 1 "GND_FLAG" H 6254 1096 50  0000 C CNN
F 2 "" H 6250 1200 50  0001 C CNN
F 3 "" H 6250 1200 50  0001 C CNN
	1    6250 1250
	1    0    0    -1  
$EndComp
$Comp
L link:PWR_FLAG #FLG0101
U 1 1 600CDE9F
P 5750 1250
F 0 "#FLG0101" H 5750 1325 50  0001 C CNN
F 1 "PWR_FLAG" H 5750 1423 50  0000 C CNN
F 2 "" H 5750 1250 50  0001 C CNN
F 3 "" H 5750 1250 50  0001 C CNN
	1    5750 1250
	1    0    0    -1  
$EndComp
$Comp
L link:VCC #PWR0106
U 1 1 600CF30F
P 5750 1250
F 0 "#PWR0106" H 5750 1100 50  0001 C CNN
F 1 "VCC" H 5767 1423 50  0000 C CNN
F 2 "" H 5750 1250 50  0001 C CNN
F 3 "" H 5750 1250 50  0001 C CNN
	1    5750 1250
	-1   0    0    1   
$EndComp
$Comp
L link:GND #PWR0107
U 1 1 600CF95C
P 6250 1250
F 0 "#PWR0107" H 6250 1000 50  0001 C CNN
F 1 "GND" H 6255 1077 50  0000 C CNN
F 2 "" H 6250 1250 50  0001 C CNN
F 3 "" H 6250 1250 50  0001 C CNN
	1    6250 1250
	-1   0    0    1   
$EndComp
$EndSCHEMATC

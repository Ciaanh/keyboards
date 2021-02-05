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
P 5900 2400
F 0 "J0" H 5950 3017 50  0000 C CNN
F 1 "Conn_02x10_Counter_Clockwise" H 5950 2926 50  0000 C CNN
F 2 "link:bridge_2x10_P2.00mm" H 5900 2400 50  0001 C CNN
F 3 "" H 5900 2400 50  0001 C CNN
	1    5900 2400
	1    0    0    -1  
$EndComp
Text GLabel 6200 2100 2    50   Input ~ 0
RGB
Text GLabel 6200 2200 2    50   Input ~ 0
SDA
Text GLabel 6200 2300 2    50   Input ~ 0
SCL
Text GLabel 6200 2400 2    50   Input ~ 0
row5
Text GLabel 6200 2500 2    50   Input ~ 0
row4
Text GLabel 6200 2600 2    50   Input ~ 0
row3
Text GLabel 6200 2700 2    50   Input ~ 0
row2
Text GLabel 6200 2800 2    50   Input ~ 0
row1
Text GLabel 6200 2900 2    50   Input ~ 0
row0
$Comp
L link:GND #PWR0103
U 1 1 600C8BB3
P 6200 2000
F 0 "#PWR0103" H 6200 1750 50  0001 C CNN
F 1 "GND" H 6205 1827 50  0000 C CNN
F 2 "" H 6200 2000 50  0001 C CNN
F 3 "" H 6200 2000 50  0001 C CNN
	1    6200 2000
	0    -1   -1   0   
$EndComp
Text GLabel 5700 2100 0    50   Input ~ 0
LED
Text GLabel 5700 2200 0    50   Input ~ 0
col0
Text GLabel 5700 2300 0    50   Input ~ 0
col1
Text GLabel 5700 2400 0    50   Input ~ 0
col2
Text GLabel 5700 2500 0    50   Input ~ 0
col3
Text GLabel 5700 2600 0    50   Input ~ 0
col4
Text GLabel 5700 2700 0    50   Input ~ 0
col5
Text GLabel 5700 2800 0    50   Input ~ 0
col6
Text GLabel 5700 2900 0    50   Input ~ 0
col7
$Comp
L link:VCC #PWR0104
U 1 1 600C952E
P 5700 2000
F 0 "#PWR0104" H 5700 1850 50  0001 C CNN
F 1 "VCC" H 5717 2173 50  0000 C CNN
F 2 "" H 5700 2000 50  0001 C CNN
F 3 "" H 5700 2000 50  0001 C CNN
	1    5700 2000
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

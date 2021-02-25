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
Text GLabel 5750 2150 0    50   Input ~ 0
RGBin
Text GLabel 5750 2350 0    50   Input ~ 0
SDA
Text GLabel 5750 2450 0    50   Input ~ 0
SCL
Text GLabel 6250 3050 2    50   Input ~ 0
row5
Text GLabel 6250 2950 2    50   Input ~ 0
row4
Text GLabel 6250 2850 2    50   Input ~ 0
row3
Text GLabel 6250 2750 2    50   Input ~ 0
row2
Text GLabel 6250 2650 2    50   Input ~ 0
row1
Text GLabel 6250 2550 2    50   Input ~ 0
row0
$Comp
L keyboard:GND #PWR0103
U 1 1 600C8BB3
P 6250 2150
F 0 "#PWR0103" H 6250 1900 50  0001 C CNN
F 1 "GND" H 6255 1977 50  0000 C CNN
F 2 "" H 6250 2150 50  0001 C CNN
F 3 "" H 6250 2150 50  0001 C CNN
	1    6250 2150
	0    -1   -1   0   
$EndComp
Text GLabel 6250 2250 2    50   Input ~ 0
LED
Text GLabel 5750 2550 0    50   Input ~ 0
col00
Text GLabel 5750 2650 0    50   Input ~ 0
col01
Text GLabel 5750 2750 0    50   Input ~ 0
col02
Text GLabel 5750 2850 0    50   Input ~ 0
col03
Text GLabel 5750 2950 0    50   Input ~ 0
col04
Text GLabel 5750 3050 0    50   Input ~ 0
col05
Text GLabel 5750 3150 0    50   Input ~ 0
col06
Text GLabel 5750 3250 0    50   Input ~ 0
col07
$Comp
L keyboard:VCC #PWR0104
U 1 1 600C952E
P 5750 3650
F 0 "#PWR0104" H 5750 3500 50  0001 C CNN
F 1 "VCC" H 5767 3823 50  0000 C CNN
F 2 "" H 5750 3650 50  0001 C CNN
F 3 "" H 5750 3650 50  0001 C CNN
	1    5750 3650
	0    -1   -1   0   
$EndComp
$Comp
L keyboard:GND_FLAG #PWR0105
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
L keyboard:PWR_FLAG #FLG0101
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
L keyboard:VCC #PWR0106
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
L keyboard:GND #PWR0107
U 1 1 600CF95C
P 6250 1250
F 0 "#PWR0107" H 6250 1000 50  0001 C CNN
F 1 "GND" H 6255 1077 50  0000 C CNN
F 2 "" H 6250 1250 50  0001 C CNN
F 3 "" H 6250 1250 50  0001 C CNN
	1    6250 1250
	-1   0    0    1   
$EndComp
Text GLabel 5750 3350 0    50   Input ~ 0
col08
Text GLabel 6250 3350 2    50   Input ~ 0
col09
Text GLabel 5750 3450 0    50   Input ~ 0
col10
Text GLabel 6250 3450 2    50   Input ~ 0
col11
Text GLabel 5750 3550 0    50   Input ~ 0
col12
Text GLabel 6250 3550 2    50   Input ~ 0
col13
Text GLabel 6250 2350 2    50   Input ~ 0
rotA
Text GLabel 6250 2450 2    50   Input ~ 0
rotB
Text GLabel 6250 3150 2    50   Input ~ 0
row6
Text GLabel 6250 3250 2    50   Input ~ 0
row7
$Comp
L keyboard:Conn_02x16_Odd_Even J0
U 1 1 6023BC28
P 5950 2850
F 0 "J0" H 6000 3767 50  0000 C CNN
F 1 "Conn_02x16_Odd_Even" H 6000 3676 50  0000 C CNN
F 2 "keyboard:bridge_2x16_P2.54mm" H 5950 2850 50  0001 C CNN
F 3 "~" H 5950 2850 50  0001 C CNN
	1    5950 2850
	1    0    0    -1  
$EndComp
Text GLabel 5750 2250 0    50   Input ~ 0
RGBout
Text GLabel 6250 3650 2    50   Input ~ 0
VBUS
$EndSCHEMATC

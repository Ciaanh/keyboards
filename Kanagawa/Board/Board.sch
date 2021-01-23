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
L board:KEY_SW_LED SW1
U 1 1 600C9296
P 3050 1350
AR Path="/600C9296" Ref="SW1"  Part="1" 
AR Path="/600B437B/600C9296" Ref="SW00"  Part="1" 
F 0 "SW1" H 3050 1605 50  0000 C CNN
F 1 "KEY_SW_LED" H 3050 1514 50  0000 C CNN
F 2 "board:SW_Cherry_MX_1.00u_PCB" H 3500 950 50  0001 C CNN
F 3 "" H 3050 1350 50  0001 C CNN
	1    3050 1350
	1    0    0    -1  
$EndComp
$Comp
L board:R R1
U 1 1 600C929C
P 3200 1700
AR Path="/600C929C" Ref="R1"  Part="1" 
AR Path="/600B437B/600C929C" Ref="R00"  Part="1" 
F 0 "R1" H 3270 1746 50  0000 L CNN
F 1 "R" H 3270 1655 50  0000 L CNN
F 2 "board:Resistors_SMD_THT" V 3130 1700 50  0001 C CNN
F 3 "" H 3200 1700 50  0001 C CNN
	1    3200 1700
	1    0    0    -1  
$EndComp
$Comp
L board:Conn_02x10_Counter_Clockwise J0
U 1 1 600C92A2
P 1200 1300
AR Path="/600C92A2" Ref="J0"  Part="1" 
AR Path="/600B437B/600C92A2" Ref="J1"  Part="1" 
F 0 "J0" H 1250 1917 50  0000 C CNN
F 1 "Conn_02x10_Counter_Clockwise" H 1250 1826 50  0000 C CNN
F 2 "board:conn_2x10_P2.00mm_Vertical" H 1200 1300 50  0001 C CNN
F 3 "~" H 1200 1300 50  0001 C CNN
	1    1200 1300
	1    0    0    -1  
$EndComp
$Comp
L board:WS2812B RGB1
U 1 1 600C92A8
P 1250 2700
AR Path="/600C92A8" Ref="RGB1"  Part="1" 
AR Path="/600B437B/600C92A8" Ref="RGB0"  Part="1" 
F 0 "RGB1" V 1204 3044 50  0000 L CNN
F 1 "WS2812B" V 1295 3044 50  0000 L CNN
F 2 "board:WS2812B" H 1500 2950 50  0001 L TNN
F 3 "" H 1350 2325 50  0001 L TNN
	1    1250 2700
	0    1    1    0   
$EndComp
$Comp
L board:GND #PWR0101
U 1 1 600C92AE
P 1500 900
AR Path="/600C92AE" Ref="#PWR0101"  Part="1" 
AR Path="/600B437B/600C92AE" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0101" H 1500 650 50  0001 C CNN
F 1 "GND" H 1505 727 50  0000 C CNN
F 2 "" H 1500 900 50  0001 C CNN
F 3 "" H 1500 900 50  0001 C CNN
	1    1500 900 
	0    -1   -1   0   
$EndComp
$Comp
L board:VCC #PWR0102
U 1 1 600C92B4
P 1000 900
AR Path="/600C92B4" Ref="#PWR0102"  Part="1" 
AR Path="/600B437B/600C92B4" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0102" H 1000 750 50  0001 C CNN
F 1 "VCC" H 1017 1073 50  0000 C CNN
F 2 "" H 1000 900 50  0001 C CNN
F 3 "" H 1000 900 50  0001 C CNN
	1    1000 900 
	0    -1   -1   0   
$EndComp
Text GLabel 1000 1000 0    50   Input ~ 0
LED
Text GLabel 1000 1100 0    50   Input ~ 0
COL0
Text GLabel 1500 1800 2    50   Input ~ 0
ROW0
Text GLabel 1500 1000 2    50   Input ~ 0
RGB
Text GLabel 3200 1850 3    50   Input ~ 0
LED
Text GLabel 2750 1150 1    50   Input ~ 0
COL0
Text GLabel 3500 1650 3    50   Input ~ 0
ROW0
Text GLabel 1250 2400 1    50   Input ~ 0
RGB
$Comp
L board:VCC #PWR0103
U 1 1 600C92C2
P 2900 1550
AR Path="/600C92C2" Ref="#PWR0103"  Part="1" 
AR Path="/600B437B/600C92C2" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0103" H 2900 1400 50  0001 C CNN
F 1 "VCC" H 2917 1723 50  0000 C CNN
F 2 "" H 2900 1550 50  0001 C CNN
F 3 "" H 2900 1550 50  0001 C CNN
	1    2900 1550
	-1   0    0    1   
$EndComp
$Comp
L board:D D1
U 1 1 600C92C8
P 3500 1500
AR Path="/600C92C8" Ref="D1"  Part="1" 
AR Path="/600B437B/600C92C8" Ref="D00"  Part="1" 
F 0 "D1" H 3500 1716 50  0000 C CNN
F 1 "D" H 3500 1625 50  0000 C CNN
F 2 "board:Diode_SMD_THT" H 3900 1350 50  0001 C CNN
F 3 "" H 3500 1500 50  0001 C CNN
	1    3500 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 1150 2750 1350
Wire Wire Line
	3350 1350 3500 1350
$Comp
L board:GND #PWR0104
U 1 1 600C92D0
P 950 2700
AR Path="/600C92D0" Ref="#PWR0104"  Part="1" 
AR Path="/600B437B/600C92D0" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0104" H 950 2450 50  0001 C CNN
F 1 "GND" H 955 2527 50  0000 C CNN
F 2 "" H 950 2700 50  0001 C CNN
F 3 "" H 950 2700 50  0001 C CNN
	1    950  2700
	0    1    1    0   
$EndComp
$Comp
L board:VCC #PWR0105
U 1 1 600C92D6
P 1550 2700
AR Path="/600C92D6" Ref="#PWR0105"  Part="1" 
AR Path="/600B437B/600C92D6" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0105" H 1550 2550 50  0001 C CNN
F 1 "VCC" H 1567 2873 50  0000 C CNN
F 2 "" H 1550 2700 50  0001 C CNN
F 3 "" H 1550 2700 50  0001 C CNN
	1    1550 2700
	0    1    1    0   
$EndComp
Text GLabel 1500 1200 2    50   Input ~ 0
SCL
Text GLabel 1500 1100 2    50   Input ~ 0
SDA
Text GLabel 1000 1200 0    50   Input ~ 0
COL1
Text GLabel 1000 1300 0    50   Input ~ 0
COL2
Text GLabel 1000 1400 0    50   Input ~ 0
COL3
Text GLabel 1000 1500 0    50   Input ~ 0
COL4
Text GLabel 1500 1700 2    50   Input ~ 0
ROW1
Text GLabel 1500 1600 2    50   Input ~ 0
ROW2
Text GLabel 1500 1500 2    50   Input ~ 0
ROW3
Text GLabel 1500 1400 2    50   Input ~ 0
ROW4
Text GLabel 1500 1300 2    50   Input ~ 0
ROW5
Text GLabel 1000 1600 0    50   Input ~ 0
COL5
Text GLabel 1000 1700 0    50   Input ~ 0
COL6
Text GLabel 1000 1800 0    50   Input ~ 0
COL7
NoConn ~ 1250 3000
$EndSCHEMATC

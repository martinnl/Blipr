EESchema Schematic File Version 2  date 26/04/2014 12:34:29
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:blipr-lib
LIBS:blipr-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date "26 apr 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L AY-3-8910 U1
U 1 1 53136FF6
P 5400 2900
F 0 "U1" H 5400 2900 60  0000 C CNN
F 1 "AY-3-8910" H 5400 2900 60  0000 C CNN
F 2 "~" H 5400 2900 60  0000 C CNN
F 3 "~" H 5400 2900 60  0000 C CNN
	1    5400 2900
	1    0    0    -1  
$EndComp
Entry Wire Line
	4350 2450 4450 2550
Entry Wire Line
	4350 2850 4450 2950
Entry Wire Line
	4350 2950 4450 3050
Entry Wire Line
	4350 3050 4450 3150
Entry Wire Line
	4350 3250 4450 3350
Entry Wire Line
	4350 3350 4450 3450
Entry Wire Line
	4350 3550 4450 3650
Entry Wire Line
	4350 3650 4450 3750
Entry Wire Line
	4350 3750 4450 3850
Entry Wire Line
	4350 2350 4450 2450
Entry Wire Line
	4350 2550 4450 2650
Entry Wire Line
	4350 2650 4450 2750
Entry Wire Line
	4350 2750 4450 2850
Entry Wire Line
	4350 3150 4450 3250
Entry Wire Line
	4350 3450 4450 3550
Entry Wire Line
	4350 3850 4450 3950
$Sheet
S 1700 1150 1250 1200
U 53596A74
F0 "DCDC5V" 50
F1 "DCDC5V.sch" 50
F2 "Vin" B L 1700 1750 60 
F3 "Vout" B R 2950 1500 60 
F4 "Gnd" B R 2950 2150 60 
$EndSheet
$Sheet
S 1750 3000 1200 1050
U 53596A78
F0 "DCDC33V" 50
F1 "DCDC33V.sch" 50
F2 "Vout" B R 2950 3250 60 
F3 "Vin" B L 1750 3500 60 
F4 "Gnd" B R 2950 3800 60 
$EndSheet
$Comp
L SN74LVC8T245DGVR U5
U 1 1 535ADBCA
P 8350 2500
F 0 "U5" H 8350 2500 60  0000 C CNN
F 1 "SN74LVC8T245DGVR" H 8350 2500 60  0000 C CNN
F 2 "~" H 8350 2500 60  0000 C CNN
F 3 "~" H 8350 2500 60  0000 C CNN
	1    8350 2500
	1    0    0    -1  
$EndComp
NoConn ~ 3800 2350
NoConn ~ 3900 3150
Wire Wire Line
	3450 1950 4450 1950
Wire Wire Line
	6350 1950 7050 1950
Wire Bus Line
	4350 3150 4350 3850
Wire Bus Line
	4350 3150 3900 3150
Wire Bus Line
	4350 3050 4350 2350
Wire Bus Line
	4350 2350 3800 2350
Wire Wire Line
	6350 3650 7150 3650
Wire Wire Line
	6350 3750 7150 3750
Wire Wire Line
	6350 3850 6400 3850
Wire Wire Line
	6400 3850 6400 4100
Wire Wire Line
	6400 4100 4450 4100
Wire Wire Line
	4450 4100 4450 3950
Wire Wire Line
	4450 2150 3800 2150
Wire Wire Line
	4450 2250 3800 2250
Wire Wire Line
	6350 2050 7050 2050
Wire Wire Line
	6350 2250 7350 2250
Wire Wire Line
	6350 2350 7350 2350
Wire Wire Line
	6350 2450 7350 2450
Wire Wire Line
	6350 2550 7350 2550
Wire Wire Line
	6350 2650 7350 2650
Wire Wire Line
	6350 2750 7350 2750
Wire Wire Line
	6350 2850 7350 2850
Wire Wire Line
	6350 2950 7350 2950
Wire Wire Line
	7350 3050 7350 3400
Wire Wire Line
	7350 3400 9700 3400
Wire Wire Line
	9400 3400 9400 3150
Wire Wire Line
	9400 3150 9300 3150
Connection ~ 7350 3150
Connection ~ 9400 3400
Wire Wire Line
	9300 2350 9650 2350
Wire Wire Line
	9300 2450 9650 2450
Wire Wire Line
	9300 2550 9650 2550
Wire Wire Line
	9300 2650 9650 2650
Wire Wire Line
	9300 2750 9650 2750
Wire Wire Line
	9300 2850 9650 2850
Wire Wire Line
	9300 2950 9650 2950
Wire Wire Line
	9300 3050 9650 3050
Wire Bus Line
	9750 3150 9750 1800
Entry Wire Line
	9650 2350 9750 2450
Entry Wire Line
	9650 2450 9750 2550
Entry Wire Line
	9650 2550 9750 2650
Entry Wire Line
	9650 2650 9750 2750
Entry Wire Line
	9650 2750 9750 2850
Entry Wire Line
	9650 2850 9750 2950
Entry Wire Line
	9650 2950 9750 3050
Entry Wire Line
	9650 3050 9750 3150
Wire Wire Line
	9300 2050 9300 1750
Wire Wire Line
	9300 1750 7350 1750
Wire Wire Line
	7350 1750 7350 2050
Wire Wire Line
	7500 1750 7500 1550
Connection ~ 7500 1750
Wire Wire Line
	9700 3400 9700 3550
$Comp
L DGND #PWR8
U 1 1 535AFAC2
P 9700 3550
F 0 "#PWR8" H 9700 3550 40  0001 C CNN
F 1 "DGND" H 9700 3480 40  0000 C CNN
F 2 "" H 9700 3550 60  0000 C CNN
F 3 "" H 9700 3550 60  0000 C CNN
	1    9700 3550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR5
U 1 1 535B0C08
P 7500 1550
F 0 "#PWR5" H 7500 1640 20  0001 C CNN
F 1 "+5V" H 7500 1640 30  0000 C CNN
F 2 "" H 7500 1550 60  0000 C CNN
F 3 "" H 7500 1550 60  0000 C CNN
	1    7500 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2150 9500 2150
Wire Wire Line
	9500 2150 9500 1650
$Comp
L +3.3V #PWR6
U 1 1 535B0CC5
P 9500 1650
F 0 "#PWR6" H 9500 1610 30  0001 C CNN
F 1 "+3.3V" H 9500 1760 30  0000 C CNN
F 2 "" H 9500 1650 60  0000 C CNN
F 3 "" H 9500 1650 60  0000 C CNN
	1    9500 1650
	1    0    0    -1  
$EndComp
$Comp
L RN42 U4
U 1 1 535B0DBE
P 3600 6150
F 0 "U4" H 3600 6050 60  0000 C CNN
F 1 "RN42" H 3600 6150 60  0000 C CNN
F 2 "~" H 3600 6150 60  0000 C CNN
F 3 "~" H 3600 6150 60  0000 C CNN
	1    3600 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 2150 7200 1100
Wire Wire Line
	7200 1100 8450 1100
Wire Wire Line
	9300 2250 9600 2250
Wire Wire Line
	9600 2250 9600 4150
Wire Wire Line
	7350 2150 7200 2150
$Comp
L DGND #PWR7
U 1 1 535AD1D8
P 9600 4150
F 0 "#PWR7" H 9600 4150 40  0001 C CNN
F 1 "DGND" H 9600 4080 40  0000 C CNN
F 2 "" H 9600 4150 60  0000 C CNN
F 3 "" H 9600 4150 60  0000 C CNN
	1    9600 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3800 3450 3800
Wire Wire Line
	2950 2150 3450 2150
Wire Wire Line
	3450 1950 3450 4350
Connection ~ 3450 3800
Wire Wire Line
	2950 3250 3100 3250
Wire Wire Line
	3100 3250 3100 2900
Wire Wire Line
	2950 1500 3150 1500
Wire Wire Line
	3150 1500 3150 900 
Wire Wire Line
	1100 1450 1100 3500
Wire Wire Line
	1100 3500 1750 3500
Wire Wire Line
	1100 1750 1700 1750
Connection ~ 1100 1750
$Comp
L DGND #PWR4
U 1 1 535AD824
P 3450 4350
F 0 "#PWR4" H 3450 4350 40  0001 C CNN
F 1 "DGND" H 3450 4280 40  0000 C CNN
F 2 "" H 3450 4350 60  0000 C CNN
F 3 "" H 3450 4350 60  0000 C CNN
	1    3450 4350
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR2
U 1 1 535AD87B
P 3100 2900
F 0 "#PWR2" H 3100 2860 30  0001 C CNN
F 1 "+3.3V" H 3100 3010 30  0000 C CNN
F 2 "" H 3100 2900 60  0000 C CNN
F 3 "" H 3100 2900 60  0000 C CNN
	1    3100 2900
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR3
U 1 1 535AD88A
P 3150 900
F 0 "#PWR3" H 3150 990 20  0001 C CNN
F 1 "+5V" H 3150 990 30  0000 C CNN
F 2 "" H 3150 900 60  0000 C CNN
F 3 "" H 3150 900 60  0000 C CNN
	1    3150 900 
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR1
U 1 1 535AD899
P 1100 1450
F 0 "#PWR1" H 1100 1400 20  0001 C CNN
F 1 "+12V" H 1100 1550 30  0000 C CNN
F 2 "" H 1100 1450 60  0000 C CNN
F 3 "" H 1100 1450 60  0000 C CNN
	1    1100 1450
	1    0    0    -1  
$EndComp
Connection ~ 3450 2150
Wire Wire Line
	4150 2150 4150 1600
Connection ~ 4150 2150
Wire Wire Line
	3950 2250 3950 1600
Connection ~ 3950 2250
Wire Wire Line
	6350 2150 6600 2150
Wire Wire Line
	6600 2150 6600 1600
$EndSCHEMATC

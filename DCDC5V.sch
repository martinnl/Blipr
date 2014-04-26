EESchema Schematic File Version 2  date 26/04/2014 23:39:23
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
Sheet 2 3
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
L LM2575S U2
U 1 1 53596A82
P 4400 2600
F 0 "U2" H 4400 2500 60  0000 C CNN
F 1 "LM2575S" H 4400 2600 60  0000 C CNN
F 2 "~" H 4400 2600 60  0000 C CNN
F 3 "~" H 4400 2600 60  0000 C CNN
	1    4400 2600
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L1
U 1 1 53596A91
P 5350 3700
F 0 "L1" V 5300 3700 40  0000 C CNN
F 1 "INDUCTOR" V 5450 3700 40  0000 C CNN
F 2 "~" H 5350 3700 60  0000 C CNN
F 3 "~" H 5350 3700 60  0000 C CNN
	1    5350 3700
	0    -1   -1   0   
$EndComp
$Comp
L CP1 C2
U 1 1 53596AA0
P 5800 4000
F 0 "C2" H 5850 4100 50  0000 L CNN
F 1 "CP1" H 5850 3900 50  0000 L CNN
F 2 "~" H 5800 4000 60  0000 C CNN
F 3 "~" H 5800 4000 60  0000 C CNN
	1    5800 4000
	1    0    0    -1  
$EndComp
$Comp
L CP1 C1
U 1 1 53596AAF
P 3800 3700
F 0 "C1" H 3850 3800 50  0000 L CNN
F 1 "CP1" H 3850 3600 50  0000 L CNN
F 2 "~" H 3800 3700 60  0000 C CNN
F 3 "~" H 3800 3700 60  0000 C CNN
	1    3800 3700
	1    0    0    -1  
$EndComp
$Comp
L ZENER D1
U 1 1 53596ABE
P 4850 4000
F 0 "D1" H 4850 4100 50  0000 C CNN
F 1 "ZENER" H 4850 3900 40  0000 C CNN
F 2 "~" H 4850 4000 60  0000 C CNN
F 3 "~" H 4850 4000 60  0000 C CNN
	1    4850 4000
	0    -1   -1   0   
$EndComp
Text HLabel 3450 3400 0    60   BiDi ~ 0
Vin
Text HLabel 5900 3700 2    60   BiDi ~ 0
Vout
Text HLabel 3650 4300 0    60   BiDi ~ 0
Gnd
Wire Wire Line
	3450 3400 4200 3400
Wire Wire Line
	3800 3500 3800 3400
Connection ~ 3800 3400
Wire Wire Line
	3800 3900 3800 4300
Wire Wire Line
	3650 4300 5800 4300
Wire Wire Line
	4850 3800 4850 3700
Wire Wire Line
	4300 3700 5050 3700
Wire Wire Line
	5650 3700 5900 3700
Wire Wire Line
	5800 3500 5800 3800
Connection ~ 5800 3700
Wire Wire Line
	4850 4200 4850 4300
Connection ~ 4850 4300
Wire Wire Line
	5800 4300 5800 4200
Wire Wire Line
	4300 3700 4300 3400
Connection ~ 4850 3700
Wire Wire Line
	4600 3400 4600 4300
Connection ~ 4600 4300
Wire Wire Line
	4500 3400 4500 3500
Wire Wire Line
	4500 3500 5800 3500
Wire Wire Line
	4400 3400 4400 4300
Connection ~ 4400 4300
Connection ~ 3800 4300
$EndSCHEMATC

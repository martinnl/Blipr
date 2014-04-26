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
Sheet 3 3
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
L TL2575 U3
U 1 1 53596D7B
P 5400 3250
F 0 "U3" H 5400 3150 60  0000 C CNN
F 1 "TL2575" H 5400 3250 60  0000 C CNN
F 2 "~" H 5400 3250 60  0000 C CNN
F 3 "~" H 5400 3250 60  0000 C CNN
	1    5400 3250
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L2
U 1 1 53596D8A
P 6400 4300
F 0 "L2" V 6350 4300 40  0000 C CNN
F 1 "INDUCTOR" V 6500 4300 40  0000 C CNN
F 2 "~" H 6400 4300 60  0000 C CNN
F 3 "~" H 6400 4300 60  0000 C CNN
	1    6400 4300
	0    -1   -1   0   
$EndComp
$Comp
L CP1 C3
U 1 1 53596D99
P 4600 4600
F 0 "C3" H 4650 4700 50  0000 L CNN
F 1 "CP1" H 4650 4500 50  0000 L CNN
F 2 "~" H 4600 4600 60  0000 C CNN
F 3 "~" H 4600 4600 60  0000 C CNN
	1    4600 4600
	1    0    0    -1  
$EndComp
$Comp
L CP1 C4
U 1 1 53596DA8
P 6900 4600
F 0 "C4" H 6950 4700 50  0000 L CNN
F 1 "CP1" H 6950 4500 50  0000 L CNN
F 2 "~" H 6900 4600 60  0000 C CNN
F 3 "~" H 6900 4600 60  0000 C CNN
	1    6900 4600
	1    0    0    -1  
$EndComp
$Comp
L ZENER D2
U 1 1 53596DB7
P 5800 4650
F 0 "D2" H 5800 4750 50  0000 C CNN
F 1 "ZENER" H 5800 4550 40  0000 C CNN
F 2 "~" H 5800 4650 60  0000 C CNN
F 3 "~" H 5800 4650 60  0000 C CNN
	1    5800 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5300 4300 6100 4300
Wire Wire Line
	5300 4050 5300 4300
Wire Wire Line
	5200 4250 5200 4050
Wire Wire Line
	4200 4250 5200 4250
Wire Wire Line
	4600 4400 4600 4250
Connection ~ 4600 4250
Wire Wire Line
	5400 4050 5400 5000
Wire Wire Line
	4600 4800 4600 5000
Wire Wire Line
	4500 5000 6900 5000
Wire Wire Line
	5800 5000 5800 4850
Connection ~ 5400 5000
Wire Wire Line
	6900 4150 6900 4400
Wire Wire Line
	6900 5000 6900 4800
Connection ~ 5800 5000
Wire Wire Line
	6900 4150 5500 4150
Wire Wire Line
	5500 4150 5500 4050
Wire Wire Line
	5600 4050 5600 5000
Connection ~ 5600 5000
Wire Wire Line
	5800 4450 5800 4300
Connection ~ 5800 4300
Wire Wire Line
	6700 4300 7200 4300
Connection ~ 6900 4300
Text HLabel 7200 4300 2    60   BiDi ~ 0
Vout
Text HLabel 4200 4250 0    60   BiDi ~ 0
Vin
Text HLabel 4500 5000 0    60   BiDi ~ 0
Gnd
Connection ~ 4600 5000
Text Label 5700 4300 0    60   ~ 0
33Out
Text Label 5700 4250 0    60   ~ 0
Out33
Text Label 5450 4300 0    60   ~ 0
Out33
$EndSCHEMATC

EESchema Schematic File Version 2
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
Date "25 apr 2014"
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
P 6500 3850
F 0 "U1" H 6500 3850 60  0000 C CNN
F 1 "AY-3-8910" H 6500 3850 60  0000 C CNN
F 2 "~" H 6500 3850 60  0000 C CNN
F 3 "~" H 6500 3850 60  0000 C CNN
	1    6500 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2900 4900 2900
Wire Wire Line
	7450 2900 8150 2900
Entry Wire Line
	7450 3500 7550 3600
Wire Bus Line
	7550 4000 8300 4000
Entry Wire Line
	7450 3400 7550 3500
Entry Wire Line
	7450 3300 7550 3400
Entry Wire Line
	7450 3200 7550 3300
Entry Wire Line
	7450 3600 7550 3700
Entry Wire Line
	7450 3700 7550 3800
Entry Wire Line
	7450 3800 7550 3900
Entry Wire Line
	7450 3900 7550 4000
Wire Bus Line
	7550 4000 7550 3300
Entry Wire Line
	5450 3400 5550 3500
Entry Wire Line
	5450 3800 5550 3900
Entry Wire Line
	5450 3900 5550 4000
Entry Wire Line
	5450 4000 5550 4100
Entry Wire Line
	5450 4200 5550 4300
Entry Wire Line
	5450 4300 5550 4400
Entry Wire Line
	5450 4500 5550 4600
Entry Wire Line
	5450 4600 5550 4700
Entry Wire Line
	5450 4700 5550 4800
Wire Bus Line
	5450 4100 5450 4800
Wire Bus Line
	5450 4100 5000 4100
Wire Bus Line
	5450 4000 5450 3300
Wire Bus Line
	5450 3300 4900 3300
Entry Wire Line
	5450 3300 5550 3400
Entry Wire Line
	5450 3500 5550 3600
Entry Wire Line
	5450 3600 5550 3700
Entry Wire Line
	5450 3700 5550 3800
Entry Wire Line
	5450 4100 5550 4200
Entry Wire Line
	5450 4400 5550 4500
Wire Wire Line
	7450 4600 8250 4600
Wire Wire Line
	7450 4700 8250 4700
Wire Wire Line
	7450 4800 7500 4800
Wire Wire Line
	7500 4800 7500 5050
Wire Wire Line
	7500 5050 5550 5050
Wire Wire Line
	5550 5050 5550 4900
Entry Wire Line
	5450 4800 5550 4900
Wire Wire Line
	5550 3100 4900 3100
Wire Wire Line
	5550 3200 4900 3200
Wire Wire Line
	7450 3000 8150 3000
Wire Wire Line
	7450 3100 8150 3100
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
L SN74LVC8T245DGVR U?
U 1 1 535ADBCA
P 9650 3750
F 0 "U?" H 9650 3750 60  0000 C CNN
F 1 "SN74LVC8T245DGVR" H 9650 3750 60  0000 C CNN
F 2 "~" H 9650 3750 60  0000 C CNN
F 3 "~" H 9650 3750 60  0000 C CNN
	1    9650 3750
	1    0    0    -1  
$EndComp
$EndSCHEMATC

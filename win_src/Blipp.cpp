// Blipp.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <time.h>
#include <windows.h>
#include <stdio.h>
using namespace std;


int bitsToInt(int size, char* bits, bool little_endian = true)
{
	int result = 0;
	if (little_endian)
	for (int n = size -1 ; n >= 0; n--)
	{

		result = (result << 8);
		result = +bits[n];
	}
	else
	for (unsigned n = 0; n <= size - 1; n++)
			result = (result << 8) + static_cast<unsigned char>(bits[n]);
	return result;
}
HANDLE initSerial()
{
	HANDLE hSerial;
	DCB dcbSerialParams = { 0 };
	COMMTIMEOUTS timeouts = { 0 };

	// Open the highest available serial port number
	fprintf(stderr, "Opening serial port...");
	hSerial = CreateFile(
		"\\\\.\\COM8", GENERIC_READ | GENERIC_WRITE, 0, NULL,
		OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hSerial == INVALID_HANDLE_VALUE)
	{
		fprintf(stderr, "Error\n");
	}
	else fprintf(stderr, "OK\n");

	// Set device parameters (38400 baud, 1 start bit,
	// 1 stop bit, no parity)
	dcbSerialParams.DCBlength = sizeof(dcbSerialParams);
	if (GetCommState(hSerial, &dcbSerialParams) == 0)
	{
		fprintf(stderr, "Error getting device state\n");
		CloseHandle(hSerial);

	}

	dcbSerialParams.BaudRate = CBR_256000;
	//dcbSerialParams.BaudRate = CBR_38400;
	dcbSerialParams.ByteSize = 8;
	dcbSerialParams.StopBits = ONESTOPBIT;
	dcbSerialParams.Parity = NOPARITY;
	if (SetCommState(hSerial, &dcbSerialParams) == 0)
	{
		fprintf(stderr, "Error setting device parameters\n");
		CloseHandle(hSerial);

	}

	// Set COM port timeout settings
	timeouts.ReadIntervalTimeout = 50;
	timeouts.ReadTotalTimeoutConstant = 50;
	timeouts.ReadTotalTimeoutMultiplier = 10;
	timeouts.WriteTotalTimeoutConstant = 50;
	timeouts.WriteTotalTimeoutMultiplier = 10;
	if (SetCommTimeouts(hSerial, &timeouts) == 0)
	{
		fprintf(stderr, "Error setting timeouts\n");
		CloseHandle(hSerial);

	}

	return hSerial;
}

void play_ym()
{
	ifstream myFile;




//	myFile.open("C:\\Program Files (x86)\\GnuWin32\\bin\\test\\colors~1.ym", ios::binary);
//	myFile.open("C:\\Program Files (x86)\\GnuWin32\\bin\\test\\IKP.bin", ios::binary);
//	myFile.open("C:\\Program Files (x86)\\GnuWin32\\bin\\test\\CYBERN~3.ym", ios::binary);
	myFile.open("C:\\Program Files (x86)\\GnuWin32\\bin\\test\\DYSRUSSI.BIN", ios::binary);
	

	char ymFormat_str[4];
	char checkString_str[8];
	char nFrames_str[4];
	char songAttribs_str[4];
	char ddSamples_str[2];
	char ymMasterClock_str[4];
	char playerFrameHz_str[2];
	char loopFrame_str[4];
	char sizeSkip_str[2];
	char sampleSize_str[4];

	char reg_dump[16];



	myFile.read(ymFormat_str, 4);
	myFile.read(checkString_str, 8);
	myFile.read(nFrames_str, 4);
	myFile.read(songAttribs_str, 4);
	myFile.read(ddSamples_str, 2);
	myFile.read(ymMasterClock_str, 4);
	myFile.read(playerFrameHz_str, 2);
	myFile.read(loopFrame_str, 4);
	myFile.read(sizeSkip_str, 2);

	int ddSamples = bitsToInt(2, ddSamples_str, 0);
	int number_of_frames = bitsToInt(4, nFrames_str, 0);

	int sampleSize;
	char temp_char[1];
	for (int i = 0; i < ddSamples; i++)
	{
		myFile.read(sampleSize_str, 4);
		sampleSize = bitsToInt(4, sampleSize_str, 0);

		for (int j = 0; j < sampleSize; j++)
			myFile.read(temp_char, 1);
	}

	int nFrames = bitsToInt(4, nFrames_str, 0);
	int ymMasterClock = bitsToInt(4, ymMasterClock_str, 0);
	int playerFrameHz = playerFrameHz = bitsToInt(2, playerFrameHz_str, 0);

	char song_name[100];
	char author_name[100];
	char song_comment[100];

	//fetch song name
	int counter = 0;
	while (counter < 100)
	{
		myFile.read(temp_char, 1);
		song_name[counter++] = temp_char[0];
		if (temp_char[0] == '\0')
			break;

	}

	//fetch Author
	counter = 0;
	while (counter < 100)
	{
		myFile.read(temp_char, 1);
		author_name[counter++] = temp_char[0];
		if (temp_char[0] == '\0')
			break;

	};

	//fetch song comment
	counter = 0;
	int fileSize = number_of_frames * 16;
	char * helaLaten = new char[fileSize];
	while (counter < 100)
	{
		myFile.read(temp_char, 1);

		song_comment[counter++] = temp_char[0];
		if (temp_char[0] == '\0')
			break;

	};
	HANDLE hSerial = initSerial();

	//fetch all frames. print to stdout
	counter = 0;

	DWORD bytes_written, total_bytes_written = 0;

	//start_time = timer.
	char dummy[1];
	myFile.read(helaLaten, fileSize);
	char lastWord[4];
	myFile.read(lastWord, 4);
	char oneFrame[16];
	char lastFrame[16];
	while (1)
	{
		time_t start_time = time(&start_time);
		time_t end_time = start_time;
		int seconds = 0;
		counter = 0;
		while (counter++ < nFrames)
		{
			//	myFile.read(reg_dump, 16);
			printf("%is", seconds);
			for (int i = 0; i < sizeof(reg_dump); i++)
			{

				oneFrame[i] = helaLaten[i*(number_of_frames)+counter];
				printf(" %X ", static_cast<unsigned char>(oneFrame[i]));
			}
			WriteFile(hSerial, oneFrame, 16, &bytes_written, NULL);
			ReadFile(hSerial, lastFrame, 16, &bytes_written, NULL);
			
			printf("\n");

			seconds = time(0) - start_time;
			_sleep(18);

		};

	}





}

void play_sndh()
{

	char one_line[100];

	ifstream sndh_dump;
	sndh_dump.open("C:\\processed.dump");
	HANDLE hSerial = initSerial();
	int test, prev = 0;
	char frame[16];

	for (int i = 0; i < 16; i++)
	{
		frame[i] = 0;
	}
	//fetch all frames. print to stdout
	

	DWORD bytes_written, total_bytes_written = 0;
	bool skip = false;
	while (1)
	{
		for (int i = 0; i <3; i++)
		{
			sndh_dump.getline(one_line, 100, ' ');
			if (sndh_dump.fail())
				break;
			//printf(one_line);
			//printf(" ");
		
		}
		sndh_dump.getline(one_line, 100);

		test =  (int)strtol(one_line, NULL, 16);
		//printf(one_line);
		//printf("\n");

		for (int i = 0; i < 3; i++)
		{
			sndh_dump.getline(one_line, 100, ' ');
			if (sndh_dump.fail())
				break;
			//printf(one_line);
			//printf(" ");
			if (strncmp("ym_readB:", one_line, 8) == 0)
			{
				sndh_dump.getline(one_line, 100, ' ');
			//	printf(one_line);
				i = 0;
			}

		}


		sndh_dump.getline(one_line, 100);
		if (sndh_dump.fail())
			break;
	//	printf(one_line);
	//	printf("\n");

		if (prev >= test)
		{
		
			WriteFile(hSerial, frame, 16, &bytes_written, NULL);
			_sleep(1);
			frame[test] = (unsigned int)strtol(one_line, NULL, 16);
		}
		else
		{
			frame[test] = (unsigned int)strtol(one_line, NULL, 16);
		}

		prev = test;
		skip = false;

	}


}
int _tmain(int argc, _TCHAR* argv[])
{
	play_ym();
	//play_sndh();

	return 0;
}


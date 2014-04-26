package com.anrik.blipr.app;

import android.util.Log;

import java.util.LinkedList;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;

public class YmReader {
    int ymFormat;
    int magicHigh;
    int magicLow;
    int nFrames;
    int songAttribs;
    int ddSamples;
    int ymMasterClock;
    int playerFrameHz;
    int loopFrame;
    int sizeSkip;

    String songName;
    String authorName;
    String songComment;

    LinkedList<Frame> songFrames;

    class Frame {
        byte[] frameData;

        public Frame(byte[] data) {
            assert data.length == 16;
            frameData = data;
        }
    }

    public YmReader(InputStream input) throws IOException {
        ymFormat = readWord(input);
        magicHigh = readWord(input);
        magicLow = readWord(input);
        nFrames = readWord(input);
        songAttribs = readWord(input);
        ddSamples = readShort(input);
        ymMasterClock = readWord(input);
        playerFrameHz = readShort(input);
        loopFrame = readWord(input);
        sizeSkip = readShort(input);

        /* Skip over the samples section */
        for (int i = 0; i < ddSamples; i++) {
            int sampleSize = readWord(input);
            input.skip(sampleSize);
        }

        songName = readString(input);
        authorName = readString(input);
        songComment = readString(input);

        Log.i("YmReader", "Song name: " + songName);
        Log.i("YmReader", "Author: " + authorName);
        Log.i("YmReader", "Comment: " + songComment);

        int fileSize = nFrames * 16;
        /* 128 MB sanity limit */
        if (fileSize > 1024*1024*128) {
            throw new IOException("Too many frames: " + Integer.toString(nFrames));
        }

        byte[] songData = new byte[fileSize];
        input.read(songData);

        songFrames = new LinkedList<Frame>();
        for(int frame = 0; frame < nFrames; frame++) {
            byte[] rawFrame = new byte[16];
            for (int reg = 0; reg < 16; reg++) {
                rawFrame[reg] = songData[reg*nFrames + frame];
            }
            songFrames.add(new Frame(rawFrame));
        }
    }

    private String readString(InputStream input) throws IOException {
        return readString(input, 64);
    }

    private String readString(InputStream input, int maxLength) throws IOException {
        byte[] raw = new byte[64];
        int lastChar = -1;
        int i;

        for(i = 0; i < 64 && lastChar != 0; i++) {
            lastChar = input.read();
            raw[i] = (byte)lastChar;
        }

        return new String(raw, 0, i-1, Charset.forName("us-ascii"));
    }

    private int bitsToInt(byte[] bits) {
        /* Default to big endian */
        return bitsToInt(bits, false);
    }

    private int bitsToInt(byte[] bits, boolean littleEndian) {
        int result = 0;
        if (littleEndian) {
            for (int n = bits.length - 1; n >= 0; n--)
                result = (result << 8) + bits[n];
        } else {
            for (int n = 0; n < bits.length; n++)
                result = (result << 8) + bits[n];
        }
        return result;
    }

    private int readWord(InputStream input) throws IOException {
        return readBytes(input, 4, false);
    }

    private int readShort(InputStream input) throws IOException {
        return readBytes(input, 2, false);
    }

    private int readBytes(InputStream input, int size, boolean littleEndian) throws IOException {
        byte[] buf = new byte[size];
        input.read(buf);
        return bitsToInt(buf);
    }


}

package com.anrik.blipr.app;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.util.Log;

import java.io.IOException;
import java.util.Set;
import java.util.UUID;

import android.os.ParcelUuid;

public class BluetoothConnection {

    private BluetoothSocket bluetoothSocket = null;

    private static final UUID SPP = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");

    public BluetoothConnection() {
        BluetoothAdapter adapter = BluetoothAdapter.getDefaultAdapter();
        Set<BluetoothDevice> devices = adapter.getBondedDevices();

        Log.i("Bluetooth", "Enumerating devices ..");
        for(BluetoothDevice device : devices) {
            Log.i("Bluetooth", "mac: " + device.getAddress() + " name: " + device.getName());
            for (ParcelUuid uuid : device.getUuids()) {
                if (uuid.getUuid() == BluetoothConnection.SPP) {
                    BluetoothSocket socket;
                    try {
                        socket = device.createRfcommSocketToServiceRecord (
                                BluetoothConnection.SPP);
                        socket.connect();
                    } catch (IOException ex) {
                        Log.e("Bluetooth", "Failed to connect: " + ex.toString());
                        continue;
                    }

                    Log.i("Bluetooth", "Connected!");
                    bluetoothSocket = socket;
                }
            }
        }
        Log.i("Bluetooth", "Done enumerating");
    }

    public boolean isConnected() {
        if (bluetoothSocket == null)
            return false;

        return bluetoothSocket.isConnected();
    }
}

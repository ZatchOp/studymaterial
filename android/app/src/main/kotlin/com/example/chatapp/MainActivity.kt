package com.example.chatapp

import android.Manifest
import android.bluetooth.BluetoothAdapter
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat


class MainActivity : FlutterActivity() {

    private val BATTERY_CHANNEL = "battery_channel";
    private val BLUETOOTH_CHANNEL = "bluetooth_channel"
    private val REQUEST_CODE_BLUETOOTH = 1001

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

MethodChannel(flutterEngine.dartExecutor.binaryMessenger,BATTERY_CHANNEL).setMethodCallHandler{
    call,result -> when(call.method){
        "getBatteryPercetage" -> {

        }
    }
}


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, BLUETOOTH_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getBluetoothInfo" -> {
                        if (hasBluetoothPermission()) {
                            val info = getBluetoothDevices()
                            result.success(info)
                        } else {
                            requestBluetoothPermission()
                            result.error("PERMISSION_DENIED", "Bluetooth permissions not granted.", null)
                        }
                    }

                    "openBluetoothSettings" -> {
                        openBluetoothSettings()
                        result.success("opened")
                    }

                    else -> result.notImplemented()
                }
            }
    }

    private fun hasBluetoothPermission(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            ContextCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH_CONNECT) == PackageManager.PERMISSION_GRANTED &&
            ContextCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH_SCAN) == PackageManager.PERMISSION_GRANTED
        } else {
            ContextCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH) == PackageManager.PERMISSION_GRANTED
        }
    }

    private fun requestBluetoothPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(
                    Manifest.permission.BLUETOOTH_CONNECT,
                    Manifest.permission.BLUETOOTH_SCAN
                ),
                REQUEST_CODE_BLUETOOTH
            )
        } else {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(Manifest.permission.BLUETOOTH),
                REQUEST_CODE_BLUETOOTH
            )
        }
    }

    private fun getBluetoothDevices(): String {
        val bluetoothAdapter: BluetoothAdapter? = BluetoothAdapter.getDefaultAdapter()
        if (bluetoothAdapter == null) {
            return "Bluetooth not supported on this device."
        }

        if (!bluetoothAdapter.isEnabled) {
            return "Bluetooth is OFF."
        }

        val pairedDevices = bluetoothAdapter.bondedDevices
        if (pairedDevices.isEmpty()) {
            return "No paired Bluetooth devices found."
        }

        val deviceInfo = StringBuilder()
        for (device in pairedDevices) {
            deviceInfo.append("Name: ${device.name}, Address: ${device.address}\n")
        }

        return deviceInfo.toString()
    }

    private fun openBluetoothSettings() {
        val intent = Intent(android.provider.Settings.ACTION_BLUETOOTH_SETTINGS)
        startActivity(intent)
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == REQUEST_CODE_BLUETOOTH) {
            // You can notify Flutter side manually here if needed
        }
    }
}

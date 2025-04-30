import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeServicess extends StatefulWidget {
  const NativeServicess({super.key});

  @override
  State<NativeServicess> createState() => _NativeServicessState();
}

class _NativeServicessState extends State<NativeServicess> {
  final BatteryService batteryService = BatteryService();
  final BluetoothService bluetoothService = BluetoothService();

  String _batteryPercentage = "Unknown";
  String _bluetoothDevice = "Unknown";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Battery & Bluetooth Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔋 Battery
            Text("Battery Level: $_batteryPercentage"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                int level = await batteryService.getBatteryLevel();
                setState(() {
                  _batteryPercentage = "$level%";
                });
              },
              child: const Text('Get Battery Level'),
            ),
            const SizedBox(height: 30),

            // 🔵 Bluetooth
            Text("Bluetooth Info:\n$_bluetoothDevice"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                String info = await bluetoothService.getBluetoothInfo();
                setState(() {
                  _bluetoothDevice = info;
                });
              },
              child: const Text('Get Bluetooth Info'),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔋 Battery Service
class BatteryService {
  static const platform = MethodChannel('battery_channel');

  Future<int> getBatteryLevel() async {
    try {
      final int batteryLevel =
          await platform.invokeMethod('getBatteryPercetage');
      return batteryLevel;
    } on PlatformException catch (e) {
      log("Failed to get battery level: '${e.message}'");
      return -1;
    }
  }
}

// 🔵 Bluetooth Service
class BluetoothService {
  static const platform = MethodChannel("bluetooth_channel");

  Future<String> getBluetoothInfo() async {
    try {
      final String result = await platform.invokeMethod('getBluetoothInfo');
      return result;
    } on PlatformException catch (e) {
      log("Bluetooth Error: ${e.message}");
      return "Failed to get Bluetooth info: ${e.message}";
    }
  }
}

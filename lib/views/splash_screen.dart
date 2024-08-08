import 'package:flutter/material.dart';
import 'package:machine_test/views/auth/login_screen.dart';
import 'package:machine_test/controller/splash.dart';// Assuming you have this service in the services directory

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashApi  _apiService = SplashApi();

  @override
  void initState() {
    super.initState();
    _sendDeviceDataAndNavigate();
  }

  Future<void> _sendDeviceDataAndNavigate() async {
    // JSON body for the API request
    Map<String, dynamic> deviceData = {
      "deviceType": "android",
      "deviceId": "C6179909526098",
      "deviceName": "Samsung-MT200",
      "deviceOSVersion": "2.3.6",
      "deviceIPAddress": "11.433.445.66",
      "lat": 9.9312,
      "long": 76.2673,
      "buyer_gcmid": "",
      "buyer_pemid": "",
      "app": {
        "version": "1.20.5",
        "installTimeStamp": "2022-02-10T12:33:30.696Z",
        "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
        "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
      }
    };

    var response = await _apiService.addDevice(deviceData);

    if (response != null) {
      print('Device added successfully: $response');
    } else {
      print('Failed to add device.');
    }

    // Proceed to the login screen after the API call completes
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (builder) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/dd.jpg'),
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}

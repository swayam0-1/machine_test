import 'dart:async';
import 'package:flutter/material.dart';
import 'package:machine_test/controller/otpverify.dart';
import 'package:machine_test/views/auth/login_screen.dart';
import 'package:machine_test/views/home_screen.dart';

class OTPScreen extends StatefulWidget {
  late final String mobileNumber;
  OTPScreen({required this.mobileNumber});
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  bool timeExpired = false;
  Timer? timer;
  Duration remainingTime = Duration(minutes: 2);
  final OTPServiceVerify _otpServiceVerify = OTPServiceVerify(); // Instance of OTPService

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    setState(() {
      remainingTime = Duration(minutes: 2);
      timeExpired = false;
    });
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime = Duration(seconds: remainingTime.inSeconds - 1);
        });
      } else {
        setState(() {
          timeExpired = true;
          timer.cancel();
        });
      }
    });
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    timer?.cancel();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  void _verifyOTP() async {
    String otp = otpControllers.map((controller) => controller.text).join();
    String deviceId = '66863b1b5120b12d7e1820ee'; // Replace with the actual device ID
    String userId = '66b4cdbefbd73e0a6562a30f'; // Replace with the actual user ID
    String mobileNumber = widget.mobileNumber;
    try {
      Map<String, dynamic> response = await _otpServiceVerify.verifyOTP(
        otp: otp,
        deviceId: deviceId,
        userId: userId,
        mobileNumber:mobileNumber,
      );
      print('API Response: $response');

        // OTP verified successfully
 if(response['status']==1){
   ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text('OTP Verified Successfully!'))
   );
   if(mounted){
     Navigator.pushReplacement(context, MaterialPageRoute(
         builder: (context)=>HomeScreen()));
   }
 }
       else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'] ?? 'OTP verification failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => LoginScreen()),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 68, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Image.asset('assets/otp.jpg', width: 100, height: 100),
            ),
            const SizedBox(height: 28,),
            const Text(
              'OTP Verification',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 18,),
            const Text(
              'We have sent a unique OTP number',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 3,),
            const Text(
              'to your mobile ',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) => buildOTPTextField(index)),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Time remaining: ${formatDuration(remainingTime)}',
                  style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w700),
                ),
                TextButton(
                  onPressed: timeExpired ? null : _verifyOTP, // Call _verifyOTP on press
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOTPTextField(int index) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: otpControllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
        },
        decoration: InputDecoration(
          counterText: '', // hide character counter
          border: InputBorder.none,
        ),
        enabled: !timeExpired, // Disable input after time limit expires
      ),
    );
  }
}
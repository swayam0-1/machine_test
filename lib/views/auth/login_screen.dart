import 'package:flutter/material.dart';
import 'package:machine_test/controller/otp.dart';


import 'package:machine_test/views/otp_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phone = TextEditingController();
  int currIn = 0;
  final OtpService _otpService = OtpService(); // Instantiate the OTPService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      backgroundColor: Colors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/dealsDray.png', width: 180, height: 180),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: ToggleSwitch(
                  minWidth: 100.0,
                  initialLabelIndex: currIn,
                  labels: ['Phone', 'Email'],
                  onToggle: (index) {
                    setState(() {
                      currIn = index!;
                    });
                  },
                  activeBgColor: [Colors.red],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white70,
                  inactiveFgColor: Colors.black,

                  // borderColor: [Colors.red],
                  cornerRadius: 35,
                ),
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: currIn == 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Glad to see you!',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Please provide your phone number',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextField(
                        controller: phone,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Phone',
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: InkWell(
                          onTap: () async {
                            String mobileNumber = phone.text.trim();
                            if (mobileNumber.isNotEmpty) {
                              try {
                                // Send OTP
                                bool otpSent = await _otpService.sendOtp(mobileNumber, "66863b1b5120b12d7e1820ee");

                                if (otpSent) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('OTP sent successfully!')),
                                  );
                                  // Navigate to OTP screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OTPScreen(mobileNumber: mobileNumber,),
                                    ),
                                  );
                                } else {
                                  // Handle error if OTP sending fails
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Failed to send OTP. Please try again.')),
                                  );
                                }
                              } catch (e) {
                                print('Failed to send OTP: $e');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Failed to send OTP. Please try again.')),
                                );
                              }
                            } else {
                              print('Enter number');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please enter a valid phone number.')),
                              );
                            }
                          },
                          child: const Center(
                            child: Text(
                              'Send Code',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: currIn == 1,
                child: Text('Email'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

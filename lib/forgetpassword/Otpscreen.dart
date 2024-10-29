import 'package:flutter/foundation.dart';
import 'package:codes_thinkers/forgetpassword/newpassword.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:codes_thinkers/backgroundimage.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        appBar: AppBar(
          title: const Text("OTP Verification"),
          backgroundColor: const Color(
            (0xFF133B7A),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
              child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'OTP Verification',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Please enter the 6-digit OTP sent to your email.',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),

                          // PinCodeTextField for OTP Input
                          PinCodeTextField(
                            enableActiveFill: true,
                            appContext: context,
                            length: 6,
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            obscuringCharacter: '*',
                            pinTheme: PinTheme(
                              activeFillColor: Colors.blue,
                              shape: PinCodeFieldShape.box,
                              fieldHeight: 50, // Adjusted height
                              fieldWidth: 50, // Adjusted width
                              borderRadius: BorderRadius.circular(10),
                              activeColor: Colors.black,
                              inactiveColor: Colors.grey,
                              selectedColor: Colors.blue,
                            ),
                            onChanged: (value) {
                              if (kDebugMode) {
                                print("Current OTP: $value");
                              }
                            },
                            onCompleted: (otp) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('OTP Verified: $otp')),
                              );
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: const Color(0xFF1446AB),
                                    title: Row(
                                      children: [
                                        Center(
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 150),
                                              child: const Icon(
                                                  Icons.check_circle,
                                                  size: 100,
                                                  color: Color(0xFF1B96EA))),
                                        ),
                                        const SizedBox(width: 10),
                                      ],
                                    ),
                                    content: const Text(
                                      'OTP Has Been Successfully Entered!',
                                      style: TextStyle(
                                          color: Color(0xFF1B96EA),
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text(
                                          'OK',
                                          style: TextStyle(
                                              color: Color(0xFF1446AB),
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 20),

                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'OTP Entered: ${otpController.text}')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Verify OTP",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Forgetscreen1()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              backgroundColor: const Color(0xFFFDD51D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Create new password',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )
                        ]),
                  ))),
        ));
  }
}

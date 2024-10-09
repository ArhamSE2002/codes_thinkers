// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class OTPVerificationScreen extends StatefulWidget {
//   const OTPVerificationScreen({super.key});

//   @override
//   State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
// }

// class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
//   TextEditingController otpController = TextEditingController();

//   @override
//   void dispose() {
//     otpController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("OTP Verification"),
//         backgroundColor: Colors.orange,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Center(
//           child: Card(
//             elevation: 8,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'OTP Verification',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Please enter the 6-digit OTP sent to your email.',
//                     style: TextStyle(fontSize: 16, color: Colors.grey),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 20),
                  
//                   // PinCodeTextField for OTP Input
//                   PinCodeTextField(
//                     appContext: context,
//                     length: 6,
//                     controller: otpController,
//                     keyboardType: TextInputType.number,
//                     obscureText: true,
//                     obscuringCharacter: '*',
//                     pinTheme: PinTheme(
//                       shape: PinCodeFieldShape.box,
//                       // fieldHeight: 50,
//                       // fieldWidth: 40,
//                       borderRadius: BorderRadius.circular(10),
//                       activeColor: Colors.orange,
//                       inactiveColor: Colors.grey,
//                       selectedColor: Colors.blue,
//                     ),
//                     onChanged: (value) {
//                       if (kDebugMode) {
//                         print("Current OTP: $value");
//                       }
//                     },
//                     onCompleted: (otp) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('OTP Verified: $otp')),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 20),
                  
//                   // Verify Button
//                   ElevatedButton(
//                     onPressed: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('OTP Entered: ${otpController.text}')),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                       backgroundColor: Colors.orange,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text(
//                       "Verify OTP",
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Card(
            elevation: 8,
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
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  
                  // PinCodeTextField for OTP Input
                  PinCodeTextField(enableActiveFill: true,
                    appContext: context,
                    length: 6,
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    obscuringCharacter: '*',
                    pinTheme: PinTheme(activeFillColor: Colors.green,
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 55,  // Adjusted height
                      fieldWidth: 50,   // Adjusted width
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
                    },
                  ),
                  const SizedBox(height: 20),
                  
                  // Verify Button
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('OTP Entered: ${otpController.text}')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Verify OTP",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

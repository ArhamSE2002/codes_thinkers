import 'package:flutter/material.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter the OTP sent to your email"),
            SizedBox(height: 20),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Otp",
              ),
              maxLength: 6, 
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String otp = _otpController.text;
                _verifyOTP(otp);
              },
              child: Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyOTP(String otp) {
    print("Entered OTP: $otp");
  }
}


// import 'package:firebase_auth/firebase_auth.dart';

// void sendOTPEmail(String email) async {
//   FirebaseAuth auth = FirebaseAuth.instance;

//   try {
//     await auth.sendSignInLinkToEmail(
//       email: email,
//       actionCodeSettings: ActionCodeSettings(
//         url: "https://your-app-url.com", // Your app's URL
//         handleCodeInApp: true,
//         androidPackageName: "com.example.yourapp", // Your Android package name
//         androidInstallApp: true,
//         androidMinimumVersion: "12",
//       ),
//     );
//     print("OTP email sent.");
//   } catch (e) {
//     print("Failed to send email OTP: $e");
//   }
// }

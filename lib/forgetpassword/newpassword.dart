
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:codes_thinkers/screens/auth/login_screen.dart';
import 'package:codes_thinkers/shared/shared_text.dart';
import 'package:codes_thinkers/theme/theme.dart';
import 'package:flutter/material.dart';

class Forgetscreen1 extends StatefulWidget {
  const Forgetscreen1({super.key});

  @override
  State<Forgetscreen1> createState() => _Forgetscreen1State();
}

class _Forgetscreen1State extends State<Forgetscreen1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmedPasswordController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _currentPasswordController.dispose();
    _confirmedPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        backgroundColor:AppColors.secondaryColor,
      title: const BigText("Forgot password"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              const SizedBox(height: 10),
              const Text(
                'Forget your password?',
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _currentPasswordController,
                obscureText: _obscureText,
                obscuringCharacter: '.',
                maxLength: 8,
                decoration: InputDecoration(
                  labelText: 'Enter Current Password',
                  border: const OutlineInputBorder(),
                  counterText: '', // Hides the counter to prevent overflow
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      size: 15,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _newPasswordController,
                obscureText: _obscureText1,
                obscuringCharacter: '.',
                maxLength: 8,
                decoration: InputDecoration(
                  labelText: 'Enter New Password',
                  border: const OutlineInputBorder(),
                  counterText: '',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText1 ? Icons.visibility : Icons.visibility_off,
                      size: 15,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText1 = !_obscureText1;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _confirmedPasswordController,
                obscureText: _obscureText2,
                obscuringCharacter: '.',
                maxLength: 8,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: const OutlineInputBorder(),
                  counterText: '',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText2 ? Icons.visibility : Icons.visibility_off,
                      size: 15,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText2 = !_obscureText2;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: const Color(0xFFFDD51D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Change Password',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: const Color(0xFFFDD51D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:codes_thinkers/backgroundimage.dart';

import 'package:codes_thinkers/screens/auth/login_screen.dart';
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
        backgroundColor: const Color(
          (0xFF133B7A),
        ),
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              const SizedBox(height: 5),
              const Text(
                'Forget  your password ?',
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                controller: _currentPasswordController,
                obscureText: _obscureText,
                maxLength: 8,
                obscuringCharacter: '.',
                decoration: InputDecoration(
                  labelText: 'Enter Current password',
                  border: const OutlineInputBorder(), 
                  suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,size: 15,
          ),
          onPressed: () {

            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
                ),
              ),
              const SizedBox(height: 5),
              

     TextFormField(
      controller: _newPasswordController,
      obscureText: _obscureText1, 
      obscuringCharacter: '.',
      maxLength: 8,
      decoration: InputDecoration(
        labelText: 'Enter new password',
        border: const OutlineInputBorder(),
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
        
              const SizedBox(height: 5),
              TextFormField(
                controller: _confirmedPasswordController,
                 obscureText: _obscureText2,
                obscuringCharacter: '.',
                maxLength: 8,
                decoration: InputDecoration(
                  labelText: 'Confirmed pasword',
                  border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
          icon: Icon(
            _obscureText2 ? Icons.visibility : Icons.visibility_off,size: 15,
          ),
          onPressed: () {

            setState(() {
              _obscureText2 = !_obscureText2;
            });
          },
        ),
                ),
              ),
              const SizedBox(height: 5),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Color(0xFFFDD51D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Change password',
                  style: TextStyle(fontSize: 15),
                ),
              ),const SizedBox(height: 10),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Color(0xFFFDD51D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'login',
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




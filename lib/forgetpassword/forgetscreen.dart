import 'package:flutter/material.dart';

class Forgetscreen extends StatefulWidget {
  const Forgetscreen({super.key});

  @override
  State<Forgetscreen> createState() => _ForgetscreenState();
}

class _ForgetscreenState extends State<Forgetscreen> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _emailController = TextEditingController(); // Controller for the email field

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assigning the form key
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display logo image
              Image.asset(
                'assets/images/logo.png',
                height: 150, // Adjust size as needed
              ),
              const SizedBox(height: 40),
              // Email TextField
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle the forgot password logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password reset link sent')),
                    );
                  }
                },
                child: const Text('Send Opt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

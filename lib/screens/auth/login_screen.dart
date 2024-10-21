import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:codes_thinkers/forgetpassword/forgetscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../shared/shared_text.dart';
import '../../theme/theme.dart';
import '../admin/home/admin_home.dart';
import '../user/user_dashboard.dart';
import 'Registration.dart';
import 'authWidgets/CustomTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance.collection("Admins");
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future setData(bool admin) async {
    final SharedPreferences perf = await SharedPreferences.getInstance();
    perf.setBool('admin', admin);
  }

  Future<void> signIn() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      QuerySnapshot querySnapshot = await firebaseFirestore
          .where('email', isEqualTo: emailController.text)
          .get();

      bool isAdmin = querySnapshot.docs.isNotEmpty;

      setState(() {
        isLoading = false;
      });
      if (isAdmin) {
        setData(true);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const AdminHome(
                      admin: true,
                    )));
      } else {
        setData(false);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const UserDashboard(admin: false)));
      }
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: e.message.toString()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 200),
                const Image(image: AssetImage('assets/images/logo.png')),
                const SizedBox(height: 25),
                CustomTextField(
                  controller: emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        await signIn();
                      }
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: AppColors.textColor,
                          )
                        : const TitleText(
                            'Login',
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationScreen(),
                          ),
                        );
                      },
                      child: const TitleTextO(
                        'SignUp',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Forgetscreen(),
                      ),
                    );
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: const Center(
        child: Text('This is the Forgot Password screen'),
      ),
    );
  }
}

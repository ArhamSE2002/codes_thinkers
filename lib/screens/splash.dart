import 'dart:async';
import 'package:codes_thinkers/screens/user/user_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admin/home/admin_home.dart';
import 'auth/login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool admin = false;
  Future getAdmin() async {
    final SharedPreferences perf = await SharedPreferences.getInstance();
    if (perf.getBool('admin') == null) {
      admin = false;
    } else {
      admin = perf.getBool('admin')!;
    }
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    getAdmin();
    setState(() {
      Timer(const Duration(seconds: 3), () {
        if (auth.currentUser == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        } else {
          if (admin) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AdminHome(
                  admin: admin,
                ),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => UserDashboard(
                  admin: admin,
                ),
              ),
            );
          }
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:   Stack(
        children: [
        
          Positioned.fill(
            child: Image.asset(
          'assets/ images/background.jpg', 
              fit: BoxFit.cover, 
            ),
          ),
      //  Center(
      //   child: Image.asset(
      //     'assets/images/logo.png',
      //     width: 200,
      //     height: 200,
        // ),
      ] ),
    );
  }
}

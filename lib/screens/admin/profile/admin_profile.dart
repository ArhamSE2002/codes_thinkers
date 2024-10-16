
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared_text.dart';
import '../../auth/login_screen.dart';
import '../../courses/courses_text.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        appBar: AppBar(
          title: const BigText("Profile"),
        ),
        body: Center(
          child: ElevatedButton(
            child: const BodyCText("Logout"),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          ),
        ));
  }
}

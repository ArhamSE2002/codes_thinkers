import 'dart:developer';
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../shared/shared_text.dart';
import '../../theme/theme.dart';
import 'authWidgets/CustomTextField.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  String fileName = "";
  String imageUrl = "";
  bool isLoading = false;

  // Pick Image from Gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      fileName = p.basename(_profileImage!.path);
    }
  }

  // Register Function
  void _register() async {
    if (_formKey.currentState!.validate()) {
      if (_profileImage != null) {
        setState(() {
          isLoading = true;
        });
        try {
          await auth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
          await uploadImg();
          showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(
                  message: "Account created successfully"));
          setState(() {
            isLoading = false;
          });
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        } on FirebaseAuthException catch (e) {
          setState(() {
            isLoading = false;
          });
          log(e.message!);
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: e.message!),
          );
        }
      } else {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
              message: "Please select a profile image."),
        );
      }
    }
  }

  // Upload Image to Firebase Storage
  Future uploadImg() async {
    final ref = firebaseStorage.ref().child("profile_images/$fileName");
    try {
      await ref.putFile(_profileImage!);
      imageUrl = await ref.getDownloadURL();
      await saveUserData();
    } on FirebaseException catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: e.message.toString(),
        ),
      );
    }
  }

  // Save User Data to Firestore
  Future saveUserData() async {
    Map<String, dynamic> data = {
      'imgUrl': imageUrl,
      'fName': firstNameController.text,
      'lName': lastNameController.text,
      'phoneNumber': phoneNumberController.text,
      'email': emailController.text,
    };
    try {
      await firebaseFirestore
          .collection("Profiles")
          .doc(phoneNumberController.text)
          .set(data);
    } on FirebaseException catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: e.message.toString(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: Padding(
        padding:
        const EdgeInsets.only(top: 0.0, bottom: 10, left: 22, right: 22),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.secondaryColor,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : const AssetImage(
                            'assets/images/default_person.png')
                        as ImageProvider,
                        child: _profileImage == null
                            ? const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        )
                            : null,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 110,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Icon(
                          Icons.add,
                          color: AppColors.secondaryColor,
                          size: 27,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: firstNameController,
                label: 'First Name',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: lastNameController,
                label: 'Last Name',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: emailController,
                label: 'Email',
                icon: Icons.email,
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
                icon: Icons.lock,
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
              const SizedBox(height: 16),
              CustomTextField(
                controller: confirmPasswordController,
                label: 'Confirm Password',
                icon: Icons.lock,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: phoneNumberController,
                label: 'Phone Number',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                height: 45,
                child: ElevatedButton(
                  onPressed: _register,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const TitleText('Register'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(letterSpacing: 0),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const TitleTextO(
                        "Sign In",
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

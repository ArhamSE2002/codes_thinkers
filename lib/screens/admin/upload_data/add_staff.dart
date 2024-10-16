import 'dart:developer';
import 'dart:io';
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../theme/theme.dart';
import '../../courses/courses_text.dart';

class AddStaff extends StatefulWidget {
  const AddStaff({super.key});

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController fieldController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  File? imagePath;
  String imageName = "";
  bool uploading = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: imagePath == null
                      ? GestureDetector(
                    onTap: () {
                      imagePicker();
                    },
                    child: const Icon(
                      Icons.image,
                      size: 150,
                    ),
                  )
                      : GestureDetector(
                    onTap: () {
                      imagePicker();
                    },
                    child: Image.file(
                      alignment: Alignment.center,
                      imagePath!,
                      height: 120,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field empty!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: fieldController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field empty!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Field"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: experienceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field empty!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Experience"),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        Map<String, dynamic> data = {
                          "name": nameController.text,
                          "field": fieldController.text,
                          "experience": experienceController.text,
                        };
                        setState(() {
                          uploading = true;
                        });
                        if (imagePath != null) {
                          await uploadCourseImage(imagePath!, data, context);
                        }
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.success(
                            message: "Staff Added",
                          ),
                        );
                        Navigator.pop(context);
                        setState(() {
                          uploading = false;
                        });
                      }
                    },
                    child: uploading
                        ? const CircularProgressIndicator(
                      color: AppColors.textColor,
                    )
                        : const TitleCText("Upload"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future imagePicker() async {
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagePath = File(pickedFile.path);
        imageName = basename(imagePath.toString());
        log(imageName);
      });
    }
  }

  Future<void> uploadCourseImage(
      File filePath, Map<String, dynamic> data, BuildContext context) async {
    final storageRef = FirebaseStorage.instance.ref();
    try {
      final courseImageRef = storageRef.child("staff/$imageName");
      await courseImageRef.putFile(filePath);
      String imageUrl = await courseImageRef.getDownloadURL();
      data["imageUrl"] = imageUrl;
      await courseData(data, context);
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }

  Future<void> courseData(Map<String, dynamic> data, BuildContext context) async {
    log(data.toString());
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {
      await firebaseFirestore.collection("Staff").add(data);
    } on FirebaseException catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: e.message.toString()),
      );
    }
  }
}

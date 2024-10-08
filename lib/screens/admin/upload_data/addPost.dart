import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../theme/theme.dart';
import '../../courses/courses_text.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleContoller = TextEditingController();
  TextEditingController shortDesContoller = TextEditingController();
  TextEditingController descriptionContoller = TextEditingController();
  TextEditingController durationContoller = TextEditingController();
  File? imagePath;
  String imageName = "";
  bool uploading = false;
  DateTime dateTime = DateTime.now();
  String name = "";
  String profileImg = "";
  String postImg = "";

  @override
  void initState() {
    userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            imagePath!,
                            height: 200,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: descriptionContoller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field empty!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Description"),
                  maxLines: null,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () async {
                          String date =
                              DateFormat('dd-MM-yyyy').format(dateTime);
                          if (formKey.currentState!.validate()) {
                            Map<String, dynamic> data = {
                              "date": date,
                              "name": name,
                              "profileImg": profileImg,
                              "postImg": postImg,
                              "description": descriptionContoller.text,
                            };
                            setState(() {
                              uploading = true;
                            });
                            if (imagePath != null) {
                              await uploadCourseImage(imagePath!, data);
                            } else {}
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.success(message: "Post Added"),
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
                            : const TitleCText("Upload")))
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
      File filePath, Map<String, dynamic> data) async {
    final storageRef = FirebaseStorage.instance.ref();
    try {
      final courseImageRef = storageRef.child("post_images/$imageName");
      await courseImageRef.putFile(filePath);
      String imageUrl = await courseImageRef.getDownloadURL();
      data["postImg"] = imageUrl;
      await courseData(data);
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }

  Future<void> courseData(Map<String, dynamic> data) async {
    log(data.toString());
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {
      await firebaseFirestore.collection("Posts").add(data);
    } on FirebaseException catch (e) {
      showTopSnackBar(Overlay.of(context as BuildContext),
          CustomSnackBar.success(message: "${e.message}"));
    }
  }

  Future userData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await firestore.collection("Profiles").get().then((value) {
        for (var doc in value.docs) {
          if (doc['email'] == auth.currentUser?.email) {
            name = "${doc['fName']} ${doc['lName']}";
            log(name);
          }
        }
      });
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }
}

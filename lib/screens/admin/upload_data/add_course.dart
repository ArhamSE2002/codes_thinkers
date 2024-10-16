import 'dart:io';
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:path/path.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final formKey = GlobalKey<FormState>();

  // Controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController shortDesController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController feeController = TextEditingController(); // Monthly fee

  File? imagePath;
  bool uploading = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        title: const Text("Add Course"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: imagePath == null
                      ? GestureDetector(
                    onTap: imagePicker,
                    child: const Icon(Icons.image, size: 150),
                  )
                      : GestureDetector(
                    onTap: imagePicker,
                    child: Image.file(
                      imagePath!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field empty!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: shortDesController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field empty!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Short Description"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field empty!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Description"),
                  maxLines: null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: durationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field empty!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Duration (months)"),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                // Monthly Fee TextField
                TextFormField(
                  controller: feeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field empty!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Monthly Fee (Rs)"),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          uploading = true;
                        });

                        if (imagePath != null) {
                          // Upload image and save course details to Firestore
                          await uploadCourseImageAndDetails(context);
                        } else {
                          // If no image is selected
                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.error(message: "Please select an image"),
                          );
                        }

                        setState(() {
                          uploading = false;
                        });
                      }
                    },
                    child: uploading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Upload"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void imagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagePath = File(pickedFile.path);
      });
    }
  }

  Future<void> uploadCourseImageAndDetails(BuildContext context) async {
    try {
      // Step 1: Upload image to Firebase Storage
      String imageFileName = basename(imagePath!.path);
      Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('courseImages/$imageFileName');

      UploadTask uploadTask = firebaseStorageRef.putFile(imagePath!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      // Step 2: Add course details to Firestore
      Map<String, dynamic> data = {
        "title": titleController.text,
        "shortDec": shortDesController.text,
        "description": descriptionController.text,
        "duration": durationController.text,
        "monthlyFee": feeController.text, // Monthly fee
        "imageUrl": imageUrl // Image URL after upload
      };

      await FirebaseFirestore.instance.collection('courses').add(data);

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(message: "Course Added"),
      );

      Navigator.pop(context); // Close the page after successful upload
    } catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: "Error uploading course: $e"),
      );
    }
  }
}

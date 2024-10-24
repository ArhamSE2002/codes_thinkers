import 'dart:io';
import 'package:codes_thinkers/screens/admin/attendance/attendancestudent.dart';
import 'package:codes_thinkers/screens/admin/students/srudent_fee.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:codes_thinkers/backgroundimage.dart';

class Newstudent1 extends StatefulWidget {
  const Newstudent1({super.key});

  @override
  State<Newstudent1> createState() => _NewstudentState();
}

class _NewstudentState extends State<Newstudent1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _regnoController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  String fileName = "";

  @override
  void dispose() {
    _regnoController.dispose();
    _nameController.dispose();
    _titleController.dispose();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: const Text(
                      'Add New Student',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.blue,
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
                            right: 100,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: const CircleAvatar(
                                backgroundColor: Color(0xFFFDD51D),
                                radius: 15,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 27,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _regnoController,
                        decoration: const InputDecoration(
                          labelText: 'Reg no',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Attendancestd()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: const Color(0xFFFDD51D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}


import 'dart:io';
import 'package:codes_thinkers/screens/admin/attendance/attendencestaff.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class Newstaff extends StatefulWidget {
  const Newstaff({super.key});

  @override
  State<Newstaff> createState() => _NewstaffState();
}

class _NewstaffState extends State<Newstaff> {
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
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen background image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(

                  image: AssetImage('assets/images/screenbackground.jpg'), // Set your background image path here

                  // image: AssetImage(
                  //     'assets/images/background_image.png'), // Set your background image path here

                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: const Text(
                        'Add New Staff',
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
                Card(
                  margin: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
                              right: 133,
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Attendancestaff()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    backgroundColor: Color(0xFFFDD51D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

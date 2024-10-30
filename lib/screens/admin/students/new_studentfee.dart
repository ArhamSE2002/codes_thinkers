import 'dart:io';
import 'package:codes_thinkers/screens/admin/attendance/attendancestudent.dart';
import 'package:codes_thinkers/screens/admin/students/srudent_fee.dart';
import 'package:codes_thinkers/shared/shared_text.dart';
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
      appBar: AppBar(
        title: const BigText("Add new student"),
        backgroundColor: Color(0xff22406F),
      ),
      body: Stack(children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: GestureDetector(
                                onTap: _pickImage,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: _profileImage != null
                                      ? Image.file(
                                          _profileImage!,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        )
                                      : Container(
                                          width: 100,
                                          height: 100,
                                          color: Colors.blue,
                                          child: const Icon(
                                            Icons.person,
                                            size: 60,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: _pickImage,
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 15, right: 93),
                                  child: CircleAvatar(
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
                            ),
                          ],
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
                            labelText: 'regNo',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _regnoController,
                          decoration: const InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder(),
                          ),
                          minLines: 1,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
            ),
            const SizedBox(height: 20),
          ],
        ),
      ]),
    );
  }
}

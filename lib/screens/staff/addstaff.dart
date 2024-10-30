import 'dart:io';
import 'package:codes_thinkers/screens/admin/attendance/attendencestaff.dart';
import 'package:codes_thinkers/shared/shared_text.dart';
import 'package:codes_thinkers/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:codes_thinkers/backgroundimage.dart';

class NewStaff1 extends StatefulWidget {
  const NewStaff1({super.key});

  @override
  State<NewStaff1> createState() => _NewStaff1State();
}

class _NewStaff1State extends State<NewStaff1> {
  final _formKey = GlobalKey <FormState>();
  final TextEditingController _titlenoController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  String fileName = "";

  @override
  void dispose() {
    _titlenoController.dispose();
    _aboutController.dispose();
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
        backgroundColor: AppColors.secondaryColor,
        title: const BigText("Add New Staff"),
      ),
      body: Stack(children: [
        Column(
          children: [
    
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
                          controller: _titlenoController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _aboutController,
                          decoration: const InputDecoration(
                            labelText: 'Designation',
                            border: OutlineInputBorder(),
                          ),
                          minLines: 2,
                          maxLines: 10,
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
                      builder: (context) => const Attendancestaff()),
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

import 'package:codes_thinkers/screens/admin/students/srudent_fee.dart';
import 'package:codes_thinkers/shared/shared_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class StudentChalaan extends StatefulWidget {
  const StudentChalaan({super.key});

  @override
  _StudentChalaanState createState() => _StudentChalaanState();
}

class _StudentChalaanState extends State<StudentChalaan> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
    Navigator.of(context).pop();
  }

  void _showImageSourceSelection() {
    showModalBottomSheet(
      backgroundColor: Color(0xff22406F),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 120,
          child: Column(
            children: [
              const Text(
                'Select Image Source',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () => _pickImage(ImageSource.camera),
                  ),
                  IconButton(
                    icon: const Icon(Icons.photo),
                    onPressed: () => _pickImage(ImageSource.gallery),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: BorderSide.strokeAlignCenter,
        title: const BigText("Upload Challan"),
        backgroundColor: Color(0xff22406F),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/screenbackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 50),
              GestureDetector(
                onTap: _showImageSourceSelection,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    height: 400,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color(0xff22406F),
                        borderRadius: BorderRadius.circular(20)),
                    child: _selectedImage == null
                        ? const Padding(
                            padding: EdgeInsets.only(left: 20, top: 0),
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 70,
                            ),
                          )
                        : Container(
                            child: Image.file(
                              File(_selectedImage!.path),
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 500, left: 120),
            child: Column(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.upload,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Attendancestd(),
                        ));
                  },
                  label: const Text(
                    'Upload',
                  ),
                ),
                ElevatedButton.icon(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Attendancestd(),
                          ));
                    },
                    label: const Text('Delete'))
              ],
            ),
          )
        ],
      ),
    );
  }
}

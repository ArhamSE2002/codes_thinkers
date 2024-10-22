import 'dart:io';
import 'package:codes_thinkers/screens/admin/attendance/attendencestaff.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:codes_thinkers/backgroundimage.dart';

class newProject extends StatefulWidget {
  const newProject({super.key});

  @override
  State<newProject> createState() => _newProjectState();
}

class _newProjectState extends State<newProject> {
  final _formKey = GlobalKey<FormState>();
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
                    margin: const EdgeInsets.only(left: 10),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                  const Text(
                    'Add New Project',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),

                   
                  Positioned(
                 
                    bottom: 0,child: ClipRRect(
  borderRadius: BorderRadius.circular(10), // Make this half the width/height
  child: Container(
    width: 100, // Adjust this to match the size of the avatar
    height: 100, // Adjust this to match the size of the avatar
    color: Colors.blue, // Replace with your background color
    child: _profileImage != null
        ? Image.file(
            _profileImage!,
            fit: BoxFit.cover,
          )
        : const Stack(
            children: [
              Image(
                image: AssetImage('assets/images/post.png'),
                fit: BoxFit.cover,
              ),
              Center(
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ],
          ),
  ),
)
,
                  
                    ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _titlenoController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _aboutController,
                decoration: const InputDecoration(
                  labelText: 'About',
                  border: OutlineInputBorder(),
                ),
                minLines: 3, 
                maxLines: 10, 
              ),

            

              const SizedBox(
                height: 60,
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
                  backgroundColor: Color(0xFFFDD51D),
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
     ] ),
      );
   
  }
}

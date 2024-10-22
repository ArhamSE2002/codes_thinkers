// import 'dart:io';
// import 'package:path/path.dart' as p;
// import 'package:codes_thinkers/screens/projects/project.dart';
// import 'package:flutter/material.dart';
// import 'package:codes_thinkers/backgroundimage.dart';
// import 'package:image_picker/image_picker.dart';

// class Staff extends StatefulWidget {
//   const Staff({super.key});

//   @override
//   State<Staff> createState() => _StaffState();
// }
// File? _profileImage;
//   final ImagePicker _picker = ImagePicker();
//   String fileName = "";

//   @override
//   void dispose() {

//   }

//   // Pick Image from Gallery
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//       fileName = p.basename(_profileImage!.path);
//     }
//   }

// class _StaffState extends State<Staff> {
//   @override
//   Widget build(BuildContext context) {
//     return BackgroundScaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(left: 10),
//                   child: const Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                     size: 30.0,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 const Text(
//                   'Staff',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Roboto',
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20), // Space between the header and button
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const newProject()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 50, vertical: 15),
//                     backgroundColor: const Color(0xFFFDD51D),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text(
//                     'Add new',
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(
//                     width: 10), // Space between button and right edge
//               ],
//             ),
//             const SizedBox(height: 20), // Space between button and card
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: 30.0,
//                   vertical: 20.0), // Padding to reduce card width
//               child: Card(
//                 elevation: 10,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                    Stack(
//                 children: [
//                   Center(
//                     child: GestureDetector(
//                       onTap: _pickImage,
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundColor: Colors.blue,
//                         backgroundImage: _profileImage != null
//                             ? FileImage(_profileImage!)
//                             : const AssetImage(
//                                     'assets/images/default_person.png')
//                                 as ImageProvider,
//                         child: _profileImage == null
//                             ? const Icon(
//                                 Icons.person,
//                                 size: 60,
//                                 color: Colors.white,
//                               )
//                             : null,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 110,
//                     bottom: 0,
//                     child: GestureDetector(
//                       onTap: _pickImage,
//                       child: const CircleAvatar(
//                         backgroundColor: Color(0xFFFDD51D),
//                         radius: 15,
//                         child: Icon(
//                           Icons.add,
//                           color: Colors.black,
//                           size: 27,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//                     const SizedBox(height: 10), // Space between image and text
//                     const Text(
//                       'Ali',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),

//                     const SizedBox(
//                         height: 10), // Space between "About" and description
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Text(
//                         "UI designer",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.white,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     const SizedBox(
//                         height: 20),

//                     // ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: 30.0,
//                   vertical: 20.0),
//               child: Card(
//                 elevation: 10,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                     Stack(
//                 children: [
//                   Center(
//                     child: GestureDetector(
//                       onTap: _pickImage,
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundColor: Colors.blue,
//                         backgroundImage: _profileImage != null
//                             ? FileImage(_profileImage!)
//                             : const AssetImage(
//                                     'assets/images/default_person.png')
//                                 as ImageProvider,
//                         child: _profileImage == null
//                             ? const Icon(
//                                 Icons.person,
//                                 size: 60,
//                                 color: Colors.white,
//                               )
//                             : null,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 110,
//                     bottom: 0,
//                     child: GestureDetector(
//                       onTap: _pickImage,
//                       child: const CircleAvatar(
//                         backgroundColor: Color(0xFFFDD51D),
//                         radius: 15,
//                         child: Icon(
//                           Icons.add,
//                           color: Colors.black,
//                           size: 27,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       'Ali',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),

//                     const SizedBox(
//                         height: 10),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Text(
//                         " App developer",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.white,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     const SizedBox(
//                         height: 20),

//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:codes_thinkers/screens/projects/project.dart';
import 'package:flutter/material.dart';
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:image_picker/image_picker.dart';

class Staff extends StatefulWidget {
  const Staff({super.key});

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  String fileName = "";

  // Pick Image from Gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
        fileName = p.basename(_profileImage!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SingleChildScrollView(
        child: Column(
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
                const SizedBox(width: 10),
                const Text(
                  'Staff',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), 
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const newProject()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    backgroundColor: const Color(0xFFFDD51D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Add new',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(
                    width: 10), 
              ],
            ),
            const SizedBox(height: 20), 
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 20.0), 
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
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
                          right: 233,
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
                    const SizedBox(height: 10), 
                    const Text(
                      'Ali',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                        height: 10), 
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "UI designer",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
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
                          right: 233,
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
                    const SizedBox(height: 10),
                    const Text(
                      'Ali',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "App developer",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

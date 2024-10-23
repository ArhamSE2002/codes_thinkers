import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/shared_text.dart'; // Ensure this import is correct
import 'StudentListTile.dart'; // Ensure this import is correct

class StudentsData extends StatefulWidget {
  const StudentsData({super.key});

  @override
  State<StudentsData> createState() => _StudentsDataState();
}

class _StudentsDataState extends State<StudentsData> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance; // Firestore instance
  List<String> adminEmail = []; // Store admin emails
  bool admin = false; // Check if user is admin

  @override
  void initState() {
    super.initState();
    userInfo(); // Fetch admin emails
    getAdmin(); // Check admin status
  }

  // Get the current user's admin status from SharedPreferences
  Future<void> getAdmin() async {
    final SharedPreferences perf = await SharedPreferences.getInstance();
    setState(() {
      admin = perf.getBool('admin') ?? false; // Fetch admin status
    });
  }

  // Fetch admin emails from Firestore
  Future<void> userInfo() async {
    QuerySnapshot admins = await firestore.collection('Admins').get();
    if (admins.docs.isNotEmpty) {
      for (var admin in admins.docs) {
        // Ensure to cast the email to a String
        adminEmail.add(admin['email'] as String);
      }
    }
    log('Admin Emails: $adminEmail'); // Log admin emails for debugging
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        title: const BigText("Students"),
      ),
      // Show Floating Action Button if the user is an admin
      floatingActionButton: admin
          ? FloatingActionButton(
        onPressed: () {
          // Add new student logic here
        },
        child: const Icon(Icons.add),
      )
          : null,
      // StreamBuilder to listen to real-time updates from Firestore
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('Profiles').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var docs = snapshot.data!.docs; // Get documents from snapshot

          // Build the ListView of students from Firestore data
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              // Access each document's data
              var studentData = docs[index].data() as Map<String, dynamic>;
              String studentEmail = studentData['email'];

              // Check if the current student's email is in the admin list
              if (adminEmail.contains(studentEmail)) {
                return const SizedBox(); // Skip displaying admin profiles
              } else {
                // Fetch the image URL from the student data
                String imageUrl = studentData['imgUrl'] ?? "assets/images/Staff.jpg"; // Default image if URL is null

                // Display student information (image, name, etc.)
                return GestureDetector(
                  onTap: () {
                    log("Tapped on: $studentData"); // Log tapped student data
                  },
                  child: studentListTile(
                      imageUrl, // Pass the image URL to the custom widget
                      "${studentData['fName']} ${studentData['lName']}",
                      false // Always true for fee status
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

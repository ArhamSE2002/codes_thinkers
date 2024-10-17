import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/shared_text.dart';
import '../../theme/theme.dart';
import '../admin/upload_data/add_course.dart';
import 'courses_custom_card.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final firestoreCollection = FirebaseFirestore.instance.collection('courses'); // Fixed collection name to lowercase

  bool admin = false;

  Future getAdmin() async {
    final SharedPreferences perf = await SharedPreferences.getInstance();
    setState(() {
      admin = perf.getBool('admin') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAdmin();
    log(admin.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        title: const BigText("Courses"),
      ),
      body: const Center(
        child: CustomCardList(),
      ),
      // floatingActionButton: admin
      //     ? FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) =>  AddCourse(),
      //       ),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // )

      //     : null,
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 10),
      //     child: Column(
      //       children: [
      //         StreamBuilder<QuerySnapshot>(
      //           stream: firestoreCollection.snapshots(),
      //           builder: (context, snapshot) {
      //             if (!snapshot.hasData) {
      //               return const Center(
      //                 child: CircularProgressIndicator(
      //                   color: AppColors.textColor,
      //                 ),
      //               );
      //             }
                  // var docs = snapshot.data!.docs;
                  // return Expanded(
                  //   child: ListView.builder(
                  //     itemCount: docs.length,
                  //     itemBuilder: (context, index) {
                  //       if (docs.isEmpty) {
                  //         return const Center(
                  //           child: Text("No courses available."),

                  //         );
                  //       }
                        // Access the required course data
                        // final course = docs[index];
                        // return const CustomCardList();
                        //   imageUrl: course['imageUrl'], // Add imageUrl field
                        //   title: course['title'],
                        //   shortDescription: course['shortDec'],
                        //   duration: course['duration'].toString(),
                        //   monthlyFee: course['monthlyFee'].toString(), // Updated to monthlyFee
                        // );
                  //     },
          );
                   
                }

    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
// }

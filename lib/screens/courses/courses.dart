import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final firestoreCollection = FirebaseFirestore.instance.collection('Courses');

  bool admin = false;
  Future getAdmin() async {
    final SharedPreferences perf = await SharedPreferences.getInstance();
    setState(() {
      admin = perf.getBool('admin') ?? false;
    });
  }

  @override
  void initState() {
    getAdmin();
    log(admin.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText("Courses"),
      ),
      floatingActionButton: admin
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddCourse(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Courses")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.textColor,
                        ),
                      );
                    }
                    var docs = snapshot.data!.docs;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            if (docs.isEmpty) {
                              return const CircularProgressIndicator(
                                color: AppColors.textColor,
                              );
                            }
                            return CoursesCustomCard(
                                docs[index]['title'],
                                docs[index]['shortDec'],
                                docs[index]['duration']);
                          }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

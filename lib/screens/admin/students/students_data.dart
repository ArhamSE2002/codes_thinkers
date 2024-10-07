import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/shared_text.dart';

import 'StudentListTile.dart';

class StudentsData extends StatefulWidget {
  const StudentsData({super.key});

  @override
  State<StudentsData> createState() => _StudentsDataState();
}

class _StudentsDataState extends State<StudentsData> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List adminEmail = [];
  bool admin = false;
  Future getAdmin() async {
    final SharedPreferences perf = await SharedPreferences.getInstance();
    setState(() {
      admin = perf.getBool('admin') ?? false;
    });
  }

  @override
  void initState() {
    userInfo();
    getAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText("Students"),
      ),
      floatingActionButton: admin
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
      body: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('Profiles').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            var docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                if (docs.isNotEmpty) {
                  if (adminEmail.contains(docs[index]['email'])) {
                    return Container();
                  } else {
                    return GestureDetector(
                      onTap: () {
                        log("${docs[index].data()}");
                      },
                      child: studentListTile(
                          "assets/images/Staff.jpg",
                          "${docs[index]['fName']} ${docs[index]['lName']}",
                          "Flutter Developer",
                          true),
                    );
                  }
                }
                return const CircularProgressIndicator();
              },
            );
          }),
    );
  }

  Future userInfo() async {
    QuerySnapshot admins = await firestore.collection('Admins').get();
    if (admins.docs.isNotEmpty) {
      for (var admin in admins.docs) {
        adminEmail.add(admin['email']);
      }
    }
    log(adminEmail.toString());
  }
}

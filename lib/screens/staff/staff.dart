import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codes_thinkers/screens/staff/staffWidget.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/shared_text.dart';
import '../admin/upload_data/add_staff.dart';

class Staff extends StatefulWidget {
  const Staff({super.key});

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText("Staff"),
      ),
      floatingActionButton: admin
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddStaff(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("Staff").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  var docs = snapshot.data!.docs;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          if (docs.isEmpty) {
                            return const CircularProgressIndicator();
                          }
                          return StaffWidget(
                            imgUrl: docs[index]["imageUrl"],
                            name: docs[index]["name"],
                            skill: docs[index]["skill"],
                            shortDec: docs[index]["shortDec"],
                            admin: admin,
                            gmail: docs[index]["gmail"],
                            linkedin: docs[index]["linkedIn"],
                            whatsappNum: docs[index]["waNum"],
                            facebook: docs[index]["fbLink"],
                            delete: () {
                              FirebaseFirestore.instance
                                  .collection("Staff")
                                  .doc(docs[index].id)
                                  .delete();
                            },
                          );
                        }),
                  );
                })
          ],
        ),
      )),
    );
  }
}

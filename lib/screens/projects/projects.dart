// import 'dart:ffi';


import 'package:codes_thinkers/screens/projects/projectWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/shared_text.dart';
import '../../theme/theme.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
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
        title: const BigText("Projects"),
      ),
      floatingActionButton: admin
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectWidget(
                  "assets/images/dummyPost.jpg", "CodeThinkers Mobile App"),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:codes_thinkers/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/shared_text.dart';
import 'courses_custom_card.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final firestoreCollection = FirebaseFirestore.instance
      .collection('courses'); 

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
        backgroundColor: AppColors.secondaryColor,
        title: const BigText("Courses"),
      ),
      body: const Center(
        child: CustomCardList(),
      ),
      
      
      
      
      
      
      
      
      
      
      
      

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      

      
      
      
      
      
      
      
      
      
      
      
      
    );
  }

  
  
  
  
  
  
}


import 'dart:developer';


import 'package:codes_thinkers/screens/user/userProfile/userProfile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../courses/courses.dart';
import '../posts/posts.dart';
import '../projects/newprojects.dart';
import '../staff/staff.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({required this.admin, super.key});
  final bool admin;

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int page = 2;

  @override
  Widget build(BuildContext context) {
    List screens = [
      const Courses(),
      const Projects(),
      Posts(admin: widget.admin),
      const Staff(),
      const Userprofile(),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        backgroundColor: AppColors.primaryColor,
        color: AppColors.secondaryColor,
        onTap: (index) {
          setState(() {
            page = index;
            log("$page");
          });
        },
        items: [
          Image.asset(
            "assets/icons/navigation/course.png",
            width: 35,
            height: 35,
            color: page == 0 ? AppColors.primaryColor : AppColors.textColor,
          ),
          Image.asset(
            "assets/icons/navigation/projects.png",
            width: 30,
            height: 30,
            color: page == 1 ? AppColors.primaryColor : AppColors.textColor,
          ),
          Image.asset(
            "assets/icons/navigation/home.png",
            width: 30,
            height: 30,
            color: page == 2 ? AppColors.primaryColor : AppColors.textColor,
          ),
          Image.asset(
            "assets/icons/navigation/staff.png",
            width: 30,
            height: 30,
            color: page == 3 ? AppColors.primaryColor : AppColors.textColor,
          ),
          Image.asset(
            "assets/icons/navigation/profile.png",
            width: 30,
            height: 30,
            color: page == 4 ? AppColors.primaryColor : AppColors.textColor,
          ),
        ],
      ),
      body: screens[page],
    );
  }
}

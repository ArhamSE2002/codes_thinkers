
import 'package:codes_thinkers/screens/admin/home/styled_admin_widgets.dart';
import 'package:flutter/material.dart';

import '../../courses/courses.dart';
import '../../posts/posts.dart';
import '../../projects/projects.dart';
import '../../staff/staff.dart';
import '../attendance/attendance.dart';
import '../profile/admin_profile.dart';
import '../students/students_data.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({required this.admin, super.key});
  final bool admin;

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const CustomAdminContainer(),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  StyledContainer("Courses", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Courses()));
                  }),
                  const Expanded(child: SizedBox()),
                  StyledContainer("Students", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentsData()));
                  }),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  StyledContainer("Posts", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Posts(
                          admin: widget.admin,
                        ),
                      ),
                    );
                  }),
                  const Expanded(child: SizedBox()),
                  StyledContainer("Projects", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Projects()));
                  }),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  StyledContainer("Attendance", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Attendance()));
                  }),
                  const Expanded(child: SizedBox()),
                  StyledContainer("Profile", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminProfile()));
                  }),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  StyledContainer("Staff", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Staff()));
                  }),
                  const Expanded(child: SizedBox()),
                  StyledContainer("Admins", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminProfile()));
                  }),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:codes_thinkers/backgroundimage.dart';
import 'package:codes_thinkers/screens/admin/attendance/attendancetwo.dart';
import 'package:codes_thinkers/screens/admin/home/animations.dart';
import 'package:codes_thinkers/screens/admin/home/styled_admin_widgets.dart';
import 'package:flutter/material.dart';
import '../../courses/courses.dart';
import '../../posts/posts.dart';
import '../../projects/projects.dart';
import '../../staff/staff.dart';
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
    return BackgroundScaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fff.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Container(
                      height: 130,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xFF295276),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF103068),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: FullCircleLoading(),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text('Students'),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: FullCircleLoading(),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text('Team'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Courses()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFF103068),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  'assets/images/Courses.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Courses',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentsData()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFF103068),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  'assets/images/students.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Student',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Posts(
                              admin: widget.admin,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xFF103068),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  'assets/images/post.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Posts',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Projects()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xFF103068),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  'assets/images/portfolio-management.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Projects',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttendanceScreen()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xFF103068),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  'assets/images/Attendence.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Attendance',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminProfile()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xFF103068),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  'assets/images/profile.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Profile',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Staff()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xFF103068),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  'assets/images/Staff.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Staff',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminProfile()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xFF103068),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  'assets/images/Admin.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Admin',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    ));
  }
}

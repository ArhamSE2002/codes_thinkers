import 'package:codes_thinkers/backgroundimage.dart';
import 'package:codes_thinkers/screens/admin/attendance/attendancestudent.dart';
import 'package:codes_thinkers/screens/admin/attendance/suggestions.dart';
import 'package:codes_thinkers/screens/admin/home/animations.dart';
import 'package:codes_thinkers/screens/admin/profile/profile.dart';
import 'package:codes_thinkers/screens/admin/students/srudent_fee.dart';
import 'package:codes_thinkers/screens/courses/courses.dart';
import 'package:codes_thinkers/screens/posts/events.dart';
import 'package:codes_thinkers/screens/projects/newprojects.dart';
import 'package:codes_thinkers/screens/staff/staffmember.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({required this.admin, super.key});
  final bool admin;

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BackgroundScaffold(
      body: Center(
        child: Container(
          width: screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background thinker.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 30),
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: screenWidth * 0.09,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildInfoCard(screenWidth, 'Students', 'Team'),
                          const SizedBox(height: 20),
                          _buildGridRow(
                              context,
                              screenWidth,
                              'Courses',
                              'assets/images/Course.png',
                              const Courses(),
                              'Student',
                              'assets/images/students.png',
                              const Attendancestd()),
                          const SizedBox(height: 20),
                          _buildGridRow(
                              context,
                              screenWidth,
                              'Events',
                              'assets/images/post.png',
                              const Events(),
                              'Projects',
                              'assets/images/portfolio-management.png',
                              const Projects()),
                          const SizedBox(height: 20),
                          _buildGridRow(
                              context,
                              screenWidth,
                              'Attendance',
                              'assets/images/Attendence.png',
                              const Attendancestudent(),
                              'Profile',
                              'assets/images/profile.png',
                              const Profile()),
                          const SizedBox(height: 20),
                          _buildGridRow(
                              context,
                              screenWidth,
                              'Staff',
                              'assets/images/Staff.png',
                              const Staff(),
                              'Suggestion',
                              'assets/images/Admin.png',
                              const Suggestions()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(double screenWidth, String label1, String label2) {
    return Center(
      child: Container(
        height: 130,
        width: screenWidth * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFF295276),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCardItem(label1, const Color(0xFF103068), Colors.white),
            _buildCardItem(label2, Colors.white, const Color(0xFF103068)),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem(String label, Color bgColor, Color textColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: FullCircleLoading(),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: textColor)),
      ],
    );
  }

  Widget _buildGridRow(
      BuildContext context,
      double screenWidth,
      String label1,
      String asset1,
      Widget route1,
      String label2,
      String asset2,
      Widget route2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildGridItem(context, screenWidth, label1, asset1, route1),
        _buildGridItem(context, screenWidth, label2, asset2, route2),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, double screenWidth, String label,
      String assetPath, Widget route) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      child: Container(
        height: 100,
        width: screenWidth * 0.4,
        decoration: BoxDecoration(
          color: const Color(0xFF103068),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 60,
                width: 60,
                child: Image.asset(assetPath),
              ),
            ),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

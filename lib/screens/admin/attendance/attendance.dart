import 'package:flutter/material.dart';
import 'attendanceWidget.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  List<AttendanceStatus> attendance = [
    AttendanceStatus.absent,
    AttendanceStatus.pending,
    AttendanceStatus.present,
    AttendanceStatus.absent,
    AttendanceStatus.pending,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: attendance.length,
          itemBuilder: (context, index) {
            return AttendanceWidget(
              "assets/images/Staff.jpg",
              "Faheem",
              "Web Developer",
              "Apr 15, 2024",
              "Paid",
              attendance[index],
            );
          },
        ),
      ),
    );
  }
}

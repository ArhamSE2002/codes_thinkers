import 'package:codes_thinkers/backgroundimage.dart';
import 'package:codes_thinkers/screens/admin/attendance/attendancestudent.dart';
import 'package:codes_thinkers/screens/admin/attendance/newstaff.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Attendancestaff extends StatefulWidget {
  const Attendancestaff({super.key});

  @override
  State<Attendancestaff> createState() => _AttendancestaffState();
}

class _AttendancestaffState extends State<Attendancestaff> {
  final List<String> _statuses = [' Status', ' Status'];

  final List<String> _reg = [
    'reg 1',
    'reg 2',
  ];
  final List<String> _employees = [
    'Employee 1',
    'Employee 2',
  ];
  late List<String> _filteredEmployees;
  final TextEditingController _searchController = TextEditingController();
  String selectedDate = ' Select date';
  @override
  void initState() {
    super.initState();
    _filteredEmployees = _employees;
    _searchController.addListener(_filterEmployees);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterEmployees() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredEmployees = _employees
          .where((employee) => employee.toLowerCase().contains(query))
          .toList();
    });
  }

  Color _getButtonColor(String status) {
    switch (status) {
      case 'Present':
        return const Color.fromARGB(255, 13, 158, 18);
      case 'Absent':
        return Colors.red;
      case 'Leave':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }

  Color _getTextColor(String status) {
    switch (status) {
      case 'Present':
        return Colors.white;
      case 'Absent':
        return Colors.white;
      case 'Leave':
        return Colors.black;
      default:
        return Colors.white;
    }
  }

  void _showStatusOptions(BuildContext context, int index) {
    showModalBottomSheet(
      backgroundColor: const Color(0xFF133B7A),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Present',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    _statuses[index] = 'Present';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Absent',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    _statuses[index] = 'Absent';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Leave',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    _statuses[index] = 'Leave';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(3120));
    if (picked != null) {
      setState(() {
        selectedDate = DateFormat('dd_MM_yyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BackgroundScaffold(
        body: Stack(children: [
      Column(children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Text(
                  'Attendance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: screenHeight * 0.02),
          width: screenWidth * 0.9,
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              fillColor: Color(0xFF133B7A),
              contentPadding: EdgeInsets.all(12.5),
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
            ),
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
          ),
          child: GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: const Color(0xFF133B7A),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        selectedDate,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Attendancestudent()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDD51D),
                      foregroundColor: Colors.white),
                  child: const Text(
                    "Student",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                    ),
                  ),
                )),
            Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Attendancestaff()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDD51D),
                      foregroundColor: Colors.white),
                  child: const Text(
                    "Staff",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                    ),
                  ),
                )),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
            child: ListView.builder(
                itemCount: _filteredEmployees.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 16),
                        margin: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF13316A),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text('${1 + index}',
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.white)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: screenHeight * 0.1,
                                width: screenHeight * 0.1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/images/churail.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_filteredEmployees[index],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  const SizedBox(height: 5),
                                  const Text('RegNo#1',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                  const SizedBox(height: 5),
                                  const Text('Graphic Designer',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white)),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed: () =>
                                    _showStatusOptions(context, index),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      _getButtonColor(_statuses[index]),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8), // Adjust padding
                                ),
                                child: Text(
                                  _statuses[index],
                                  style: TextStyle(
                                      color: _getTextColor(_statuses[index])),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Newstaff()),
                          );
                        },
                        icon: const CircleAvatar(
                          backgroundColor: Color(0xFFFDD51D),
                          radius: 30,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  );
                }))
      ])
    ]));
  }
}

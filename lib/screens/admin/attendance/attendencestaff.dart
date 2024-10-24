
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:codes_thinkers/screens/admin/attendance/attendancestudent.dart';
import 'package:codes_thinkers/screens/admin/attendance/newstaff.dart';
import 'package:flutter/material.dart';

class Attendancestaff extends StatefulWidget {
  const Attendancestaff({super.key});

  @override
  State<Attendancestaff> createState() => _AttendancestaffState();
}

class _AttendancestaffState extends State<Attendancestaff> {
  final List<String> _statuses = ['Select Status', 'Select Status'];

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BackgroundScaffold(
      body: Stack(children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: screenWidth * 0.03),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                Container(
                    child: const Text(
                  'Attendance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
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
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      left: screenWidth * 0.4,
                    ),
                    child: const Text(
                      '17-oct-2024',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    )),
                    Spacer(),
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  child: const Icon(
                    Icons.dataset,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ),
              ],
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
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredEmployees.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.05),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF13316A),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text('${1 + index}',
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white)),
                          SizedBox(width: screenWidth * 0.08),
                          Container(
                            height: screenHeight * 0.12,
                            width: screenWidth * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/images/motaoo.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_filteredEmployees[index],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: screenHeight * 0.01),
                              const Text('RegNo#1',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                              SizedBox(height: screenHeight * 0.01),
                              const Text('Graphic Designer',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                             onPressed: () =>
                                  _showStatusOptions(context, index),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    _getButtonColor(_statuses[index]),
                              ),
                              child: Text(
                                _statuses[index],
                                style: TextStyle(
                                    color: _getTextColor(_statuses[index])),
                              ),
                            ),
                          ],
                        ),
                      ),

                  
                    
                  );
                },
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Newstaff()),
                );
              },
              icon: const CircleAvatar(
                backgroundColor: Color(0xFFFDD51D),radius: 30,
                child: Icon(
                  Icons.add,
                  color: Colors.white,size: 30,
                ),
              ),
             
            )
          ],
        ),
      ]),
    );
  }
}

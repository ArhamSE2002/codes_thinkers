import 'package:codes_thinkers/theme/theme.dart'; // Assuming AppColors is defined here
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final List<String> _statuses = ['Select Status', 'Select Status']; // List to hold statuses for each employee
  final List<String> _employees = [
    'Anugrah Prasetya',
    'Another Employee',
  ]; // Original list of employees
  late List<String> _filteredEmployees; // List for filtered employees
  final TextEditingController _searchController = TextEditingController(); // Controller for the search bar

  @override
  void initState() {
    super.initState();
    _filteredEmployees = _employees; // Initialize the filtered list
    _searchController.addListener(_filterEmployees); // Add listener to the search controller
  }

  @override
  void dispose() {
    _searchController.dispose(); // Dispose of the controller
    super.dispose();
  }

  void _filterEmployees() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      // Filter employees based on the search query
      _filteredEmployees = _employees
          .where((employee) => employee.toLowerCase().contains(query))
          .toList();
    });
  }

  // Define colors for each status
  Color _getButtonColor(String status) {
    switch (status) {
      case 'Present':
        return const Color.fromARGB(255, 193, 235, 146); // Light green for Present
      case 'Absent':
        return Colors.red; // Red for Absent
      case 'Leave':
        return Colors.grey; // Grey for Leave
      default:
        return Colors.blue; // Default color
    }
  }

  Color _getTextColor(String status) {
    switch (status) {
      case 'Present':
        return Colors.green; // Dark green for Present
      case 'Absent':
        return Colors.white; // White for Absent text
      case 'Leave':
        return Colors.black; // Black for Leave
      default:
        return Colors.white; // Default text color
    }
  }

  void _showStatusOptions(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: const Text('Present'),
                onTap: () {
                  setState(() {
                    _statuses[index] = 'Present'; // Update status for the specific employee
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Absent'),
                onTap: () {
                  setState(() {
                    _statuses[index] = 'Absent'; // Update status for the specific employee
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Leave'),
                onTap: () {
                  setState(() {
                    _statuses[index] = 'Leave'; // Update status for the specific employee
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
    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // Updated this line
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: SizedBox(
          width: 300,
          child: TextField(
            controller: _searchController, // Set the controller to the search bar
            decoration: const InputDecoration(
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 11, right: 11, top: 33),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ID", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(width: 25),
                  Text("Employee", style: TextStyle(fontSize: 16, color: Colors.black)),
                  Spacer(),
                  Text("Status", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Display filtered employee cards
            Expanded(
              child: ListView.builder(
                itemCount: _filteredEmployees.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                            Text('${1 + index}', style: const TextStyle(fontSize: 14, color: Colors.black)), // Example ID
                            const SizedBox(width: 25),
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=826&t=st=1728292833~exp=1728293433~hmac=0eba3ac1fb2f08336c5800dfd6f0043f41b3533a788ad98c95a89fdfe76bd5e1',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_filteredEmployees[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                                const Text('Graphic Designer', style: TextStyle(fontSize: 14, color: Colors.grey)), // Example role
                              ],
                            ),
                            const Spacer(),

                            // Button to show status options for the employee
                            ElevatedButton(
                              onPressed: () => _showStatusOptions(context, index),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _getButtonColor(_statuses[index]), // Set background color based on status
                              ),
                              child: Text(
                                _statuses[index],
                                style: TextStyle(color: _getTextColor(_statuses[index])), // Set text color based on status
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Divider after each container
                      const Divider(thickness: 0.5, color: Colors.grey),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

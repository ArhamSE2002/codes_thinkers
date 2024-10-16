import 'package:codes_thinkers/backgroundimage.dart';
import 'package:codes_thinkers/theme/theme.dart'; 
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final List<String> _statuses = ['Select Status', 'Select Status']; 
  final List<String> _employees = [
    'Anugrah Prasetya',
    'Another Employee',
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
        return const Color.fromARGB(255, 0, 146, 5); 
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
        return const Color.fromARGB(255, 255, 255, 255); 
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
                    _statuses[index] = 'Present'; 
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Absent'),
                onTap: () {
                  setState(() {
                    _statuses[index] = 'Absent'; 
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Leave'),
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
    return BackgroundScaffold(
      
      appBar: AppBar(shadowColor: Colors.white,
        backgroundColor: Colors.blue,
        title: SizedBox(
          width: 300,
          child: TextField(
            controller: _searchController, 
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
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 11, right: 11, top: 13),
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

                           
                            ElevatedButton(
                              onPressed: () => _showStatusOptions(context, index),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _getButtonColor(_statuses[index]),
                              ),
                              child: Text(
                                _statuses[index],
                                style: TextStyle(color: _getTextColor(_statuses[index])), 
                              ),
                            ),
                          ],
                        ),
                      ),
                     
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

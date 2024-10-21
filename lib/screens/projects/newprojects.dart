// import 'package:codes_thinkers/backgroundimage.dart';
// import 'package:codes_thinkers/screens/projects/projectWidget.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../shared/shared_text.dart';

// class Projects extends StatefulWidget {
//   const Projects({super.key});

//   @override
//   State<Projects> createState() => _ProjectsState();
// }

// class _ProjectsState extends State<Projects> {
//   bool admin = false;
//   Future getAdmin() async {
//     final SharedPreferences perf = await SharedPreferences.getInstance();
//     setState(() {
//       admin = perf.getBool('admin') ?? false;
//     });
//   }

//   @override
//   void initState() {
//     getAdmin();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BackgroundScaffold(
//       appBar: AppBar(
//         title: const BigText("Projects"),
//       ),
//       floatingActionButton: admin
//           ? FloatingActionButton(
//               onPressed: () {},
//               child: const Icon(Icons.add),
//             )
//           : null,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 13, right: 13, top: 10),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

import 'package:codes_thinkers/screens/projects/project.dart';
import 'package:flutter/material.dart';
import 'package:codes_thinkers/backgroundimage.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Add New Project',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Space between the header and button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const newProject()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    backgroundColor: const Color(0xFFFDD51D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Add new',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(
                    width: 10), // Space between button and right edge
              ],
            ),
            const SizedBox(height: 20), // Space between button and card
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 20.0), // Padding to reduce card width
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/Attendence.png',
                        fit: BoxFit.cover,
                        height: 100, // Image height inside card
                        width: 100,
                      ),
                    ),
                    const SizedBox(height: 10), // Space between image and text
                    const Text(
                      'Code Thinker',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Space between title and "About"
                    Container(
                      margin: const EdgeInsets.only(right: 400),
                      child: const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFDD51D),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Space between "About" and description
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        """Code thinker is a software house situated in Bahawalpur. It provides different services to its clients. We create websites and apps that you can check out.""",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                        height: 20), // Space between description and button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const newProject()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        backgroundColor: const Color(0xFFFDD51D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Visit Site',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20), // Space after the button
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Space between two cards
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 20.0), // Padding to reduce card width
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/post.png',
                        fit: BoxFit.cover,
                        height: 100, // Image height inside card
                        width: 100,
                      ),
                    ),
                    const SizedBox(height: 10), // Space between image and text
                    const Text(
                      'Getaway Services',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Space between title and "About"
                    Container(
                      margin: const EdgeInsets.only(right: 400),
                      child: const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFDD51D),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Space between "About" and description
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        """Code thinker is a software house situated in Bahawalpur. It provides different services to its clients. We create websites and apps that you can check out.""",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                        height: 20), // Space between description and button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const newProject()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        backgroundColor: const Color(0xFFFDD51D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Visit Site',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20), // Space after the button
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                  const Text(
                    'Add New Project',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
               Row(mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const newProject()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          backgroundColor: Color(0xFFFDD51D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Add new',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                 ],
               ),
            Column(
  children: [
    Stack(
      children: [
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 100, width: 100,// Increase the height of the Card
              child: Image.asset(
                'assets/images/post.png',
                fit: BoxFit.cover,
                height: 400, // Adjust height of the image to match card
                width: double.infinity,
              ),
            ),
          ),
        ),
      ],
    ),
    
    const SizedBox(height: 10), // Add spacing after image
    
    Container(
      child: const Text(
        'Getaway services',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    ),
    
    const SizedBox(height: 10), // Add spacing
    
    const Text(
      'About',
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    ),
    
    const SizedBox(height: 10), // Add spacing
    
    const SizedBox(
      height: 100,
      width: 100,
      child: Text(
        """Code thinker is a software house situated in Bahawalpur. It provides different services to its clients. We create websites and apps that you can check out.""",
        style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Colors.white),
      ),
    ),
    
   // Push the button to the bottom
    
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const newProject()),
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
  ],
)
         ] )));}}
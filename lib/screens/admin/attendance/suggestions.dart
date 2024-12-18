import 'package:codes_thinkers/shared/shared_text.dart';
import 'package:flutter/material.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({super.key});

  void _showSurveyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xff2F52A4),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Expanded(
                child: const Text(
                  'How To Improve?',
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
            ],
          ),
          content: const SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Students:',
                  style: TextStyle(color: Colors.white),
                ),
                const TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Enter your suggestions here...',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Staff:',
                  style: TextStyle(color: Colors.white),
                ),
                const TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Enter your suggestions here...',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFDD51D)),
              onPressed: () {
                Navigator.of(context).pop();
                _showSubmissionDialog(context);
              },
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSubmissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xff2F52A4),
          title: const Column(
            children: [
              Icon(
                Icons.check_circle,
                color: Color(0xffFDD51D),
                size: 60,
              ),
              SizedBox(height: 10),
              Text(
                'Submitted Successfully!',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFDD51D)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: BorderSide.strokeAlignCenter,
        title: const BigText("Suggestions"),
        backgroundColor: Color(0xff22406F),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/screenbackground.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    color: const Color(0xff143270),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/avator.jpg'),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'The Break System',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'This is a description of the suggestion or event.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFDD51D)),
                            onPressed: () => _showSurveyDialog(context),
                            child: const Text(
                              'Take Survey',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    color: const Color(0xff143270),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/image.jpg'),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Time Management',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'This is a description of the suggestion or event.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFDD51D)),
                            onPressed: () => _showSurveyDialog(context),
                            child: const Text(
                              'Take Survey',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                  child: IconButton(
                onPressed: () {},
                icon: const CircleAvatar(
                  backgroundColor: Color(0xFFFDD51D),
                  radius: 25,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

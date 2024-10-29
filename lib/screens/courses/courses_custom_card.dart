


import 'package:codes_thinkers/screens/courses/courseimage.dart';
import 'package:flutter/material.dart';

class CustomCardList extends StatefulWidget {
  const CustomCardList({super.key});

  @override
  _CustomCardListState createState() => _CustomCardListState();
}

class _CustomCardListState extends State<CustomCardList> {
  List<Map<String, String>> items = [
    {
      "image": "assets/images/app image.jpg",
      "title": "App Development",
      "Course duration": "6 Month",
      "fee": "7500 per month"
    },
    {
      "image": "assets/images/Digitalimage.jpg",
      "title": "Digital Marketing",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    },
    {
      "image": "assets/images/web image.jpg",
      "title": "Web Development",
      "Course duration": "6 Month",
      'fee': '7500 per month'
    },
    {
      "image": "assets/images/ui designer.jpg",
      "title": "UX /&UI designing",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    },
    {
      "image": "assets/images/seo.jpg",
      "title": "SEO",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    },
    {
      "image": "assets/images/web hosting.jpg",
      "title": "Web Hosting",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    },
    {
      "image": "assets/images/wordpress.jpg",
      "title": "WordPress",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    },
     {
      "image": "assets/images/lead generation.jpg",
      "title": "Lead generation",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    }, {
      "image": "assets/images/portfolio.png",
      "title": "Portfolio",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    }, {
      "image": "assets/images/python.jpg",
      "title": "Python",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    }, {
      "image": "assets/images/Flutter.png",
      "title": "Flutter development",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    }, {
      "image": "assets/images/webdesigning.jpg",
      "title": "Web Designing",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    }, {
      "image": "assets/images/laravel.jpg",
      "title": "Laravel",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    }, {
      "image": "assets/images/datatyping.jpg",
      "title": "Data Entery",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    }, {
      "image": "assets/images/contentwritting.jpg",
      "title": "Content Writting",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    }, {
      "image": "assets/images/anderiod.jpg",
      "title": "Anderiod Development",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    },
    {
      "image": "assets/images/2D 3D.jpg",
      "title": "2D3D Animation",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    },
    {
      "image": "assets/images/graphi.png",
      "title": "Graphic Designing",
      "Course duration": "6 Month",
      'fee': '6500 per month'
    },
  ];

  void _showCourseDetails(String title, String duration, String fee) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Course Details',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: Text(
            '\nTitle:$title\nCourse duration: $duration\nFee:$fee',
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Card with full image
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Image.asset(
                        items[index]["image"]!,
                        fit: BoxFit.cover,
                        height: 250,
                        width: double.infinity,
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                // .withOpacity(0.7), // Gradient color
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index]["title"]!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Course duration: ${items[index]["Course duration"]}",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                  bottom: 30,
                  right: 30,
                  child: Column(children: [
                    ElevatedButton(
                      onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const Courseimage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                      ),
                      child: const Text(
                        "Learn more",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ])),
              const SizedBox(height: 8),
              Positioned(
                bottom: -11,
                right: -11,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 20, // Circular icon button
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 15,
                        ),
                        onPressed: () {
                          _showCourseDetails(
                              items[index]["title"]!,
                              items[index]["Course duration"]!,
                              items[index]["fee"]!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

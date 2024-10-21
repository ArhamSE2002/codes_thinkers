// import 'package:flutter/material.dart';
// class CustomCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String shortDescription;
//   final String duration;
//   final String monthlyFee; // Renamed from fee to monthlyFee

//   const CustomCard({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     required this.shortDescription,
//     required this.duration,
//     required this.monthlyFee, // Updated parameter name
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Implement any action when the card is tapped
//         // For example, navigate to a course details page
//       },
//       child: Card(
//         elevation: 8, // A soft shadow for the card
//         margin: const EdgeInsets.all(10),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15), // More rounded corners
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [Colors.yellow, Colors.lightBlueAccent], // Gradient colors
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(15.0), // Increased padding
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Course Image
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(15), // Ensure image matches card's border radius
//                   child: Image.asset(
//                     imageUrl,
//                     height: 200, // Slightly larger height for the image
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => Container(
//                       height: 200,
//                       color: Colors.grey[300], // Placeholder color
//                       child: const Center(
//                         child: Icon(Icons.broken_image, color: Colors.grey), // Placeholder icon
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),

//                 // Course Title
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 20, // Slightly larger font size
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white, // Changed color to white for visibility
//                   ),
//                 ),
//                 const SizedBox(height: 5),

//                 // Short Description
//                 Text(
//                   shortDescription,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.white70, // Lighter color for improved readability
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 10),

//                 // Course Duration and Fee
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(Icons.access_time, size: 16, color: Colors.white), // Icon for duration
//                         const SizedBox(width: 5),
//                         Text(
//                           "Duration: $duration months",
//                           style: const TextStyle(
//                             fontSize: 14,
//                             color: Colors.white, // Changed color to white
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         const Icon(Icons.money, size: 16, color: Colors.white), // Icon for fee
//                         const SizedBox(width: 5),
//                         Text(
//                           "Rs $monthlyFee", // Updated label
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white, // Changed color to white for visibility
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),

//                 // Button for More Info
//                 ElevatedButton(
//                   onPressed: () {
//                     // Implement navigation to course details
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white, // Button color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text("More Info",style: TextStyle(color: Colors.black),),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//

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
      "Course duration": "6 Month"
    },
    {
      "image": "assets/images/Digitalimage.jpg",
      "title": "Digital Market",
      "Course duration": "6 Month"
    },
    {
      "image": "assets/images/web image.jpg",
      "title": "Web Development",
      "Course duration": "6 Month"
    },
    {
      "image": "assets/images/ui designer.jpg",
      "title": "UX /&UI designer",
      "Course duration": "6 Month"
    },
    {
      "image": "assets/images/seo.jpg",
      "title": "SEO",
      "Course duration": "6 Month"
    },
    {
      "image": "assets/images/web hosting.jpg",
      "title": "Web Hosting",
      "Course duration": "6 Month"
    },
     {
      "image": "assets/images/wordpress.jpg",
      "title": "Word press",
      "Course duration": "6 Month"
    },
  ];

  void _showCourseDetails(String title, String Courseduration) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Course Details'),
          content: Text(
            '$title\nCourse duration: $Courseduration',
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
      padding: EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
               Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                Container(
                    child: const Text(
                  'Course',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                )),
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
                                    offset: Offset(1.0, 1.0),
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
                        print("Start button pressed");
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
                          _showCourseDetails(items[index]["title"]!,
                              items[index]["Course duration"]!);
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

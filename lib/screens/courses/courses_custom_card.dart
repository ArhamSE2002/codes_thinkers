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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widget Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Scrollable Cards')),
        body: CustomCardList(),
      ),
    );
  }
}

class CustomCardList extends StatefulWidget {
  @override
  _CustomCardListState createState() => _CustomCardListState();
}

class _CustomCardListState extends State<CustomCardList> {
  // Yeh list dynamic data ke liye hai
  List<Map<String, String>> items = [
    {"image": "assets/images/app image.jpg", "title": "App Development", "fee": "Rs 1000",},
    {"image": "assets/images/Digitalimage.jpg", "title": "Digital Market", "fee": "Rs 2000"},
    {"image": "assets/images/web image.jpg", "title": "Web Development", "fee": "Rs 3000"},
    {"image": "assets/images/item4.png", "title": "Item 4", "fee": "Rs 4000"},
    {"image": "assets/images/item5.png", "title": "Item 5", "fee": "Rs 5000"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            child: ListTile(
              leading: Image.asset(items[index]["image"]!),
              title: Text(items[index]["title"]!),
              subtitle: Text("Fee: ${items[index]["fee"]}"),
              
            ),
          ),
        );
      },
    );
  }
}


import 'package:codes_thinkers/screens/posts/new_event.dart';
import 'package:flutter/material.dart';


class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Text(
                'Events',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Event...',
                  filled: true,
                  fillColor: const Color(0xff113674),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 320),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const NewEventScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFDD51D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Add New',),
                ),
              ),
              const SizedBox(height: 16),
             const EventCard(
                name: 'Ali Hassan',
                rollNumber: 'Reg# 101',
                imageUrl: 'assets/images/image.jpg',
              ),
            const  EventCard(
                name: 'Shahnawaz',
                rollNumber: 'Reg# 102',
                imageUrl: 'assets/images/image.jpg',
              ),
             const EventCard(
                name: 'Mamoon Rasheed',
                rollNumber: 'Reg# 103',
                imageUrl: 'assets/images/image.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String name;
  final String rollNumber;
  final String imageUrl;

  const EventCard({
    Key? key,
    required this.name,
    required this.rollNumber,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(color: Color(0xff132F69),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(imageUrl),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          rollNumber,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert,color: Colors.white,),
                  onPressed: () {
                  
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up,color: Colors.white,),
                  onPressed: () {
                  
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.comment,color: Colors.white),
                  onPressed: () {
                   
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

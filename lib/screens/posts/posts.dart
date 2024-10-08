
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codes_thinkers/screens/posts/postWidget.dart';

import 'package:flutter/material.dart';


import '../../shared/shared_text.dart';
import '../admin/upload_data/addPost.dart';

class Posts extends StatefulWidget {
  const Posts({required this.admin, super.key});
  final bool admin;

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  // Example dynamic variables
  final String username = "John Doe";
  final String postImage = "assets/images/dummyPost.jpg";
  final int likes = 3000;
  final int comments = 220;
  final String description =
      """This is a dummy description text for the post. This is a very long description that exceeds the 2-line limit. It continues to demonstrate how text truncation works and how the 'Read More' feature will be implemented.
      This is a dummy description text for the post. This is a very long description that exceeds the 2-line limit. It continues to demonstrate how text truncation works and how the 'Read More' feature will be implemented.""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText("Home"),
      ),
      floatingActionButton: widget.admin
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPost(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("Posts").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  var doc = snapshot.data!.docs;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: doc.length,
                        itemBuilder: (context, index) {
                          if (doc.isEmpty) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return PostCard(
                            admin: widget.admin,
                            username: doc[index]['name'],
                            postImage: doc[index]['postImg'],
                            likes: likes,
                            comments: comments,
                            description: doc[index]['description'],
                            onDelete: () {
                              // Handle delete logic
                              FirebaseFirestore.instance
                                  .collection('Posts')
                                  .doc(doc[index].id)
                                  .delete();
                            },
                          );
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

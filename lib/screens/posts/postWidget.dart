import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class PostCard extends StatelessWidget {
  final bool admin;
  final String username;
  final String postImage;
  final int likes;
  final int comments;
  final String description;
  final VoidCallback onDelete;

  const PostCard({
    super.key,
    required this.admin,
    required this.username,
    required this.postImage,
    required this.likes,
    required this.comments,
    required this.description,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          PostHeader(admin: admin, username: username, onDelete: onDelete),
          PostImage(imagePath: postImage),
          PostActions(likes: likes, comments: comments),
          PostDescription(description: description),
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final bool admin;
  final String username;
  final VoidCallback onDelete;

  const PostHeader({
    super.key,
    required this.admin,
    required this.username,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: const CircleAvatar(
        radius: 20,
        child: Icon(Icons.person),
      ),
      title: Text(
        username,
        style: const TextStyle(
          letterSpacing: 0,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: IconButton(
        onPressed: onDelete,
        icon: admin ? const Icon(Icons.delete, color: Colors.red) : const SizedBox(),
      ),
    );
  }
}

class PostImage extends StatelessWidget {
  final String imagePath;

  const PostImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      color: AppColors.primaryColor,
      child: Image.network(
        imagePath,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}

class PostActions extends StatelessWidget {
  final int likes;
  final int comments;

  const PostActions({super.key, required this.likes, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 33,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border, color: Colors.black87),
            ),
          ),
          Text(
            "$likes",
            style: const TextStyle(color: Colors.black87),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 33,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.reviews, color: Colors.black87),
            ),
          ),
          Text(
            "$comments",
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class PostDescription extends StatefulWidget {
  final String description;

  const PostDescription({super.key, required this.description});

  @override
  _PostDescriptionState createState() => _PostDescriptionState();
}

class _PostDescriptionState extends State<PostDescription>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const int descriptionMaxLines = 2;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: ConstrainedBox(
              constraints: isExpanded
                  ? const BoxConstraints()
                  : const BoxConstraints(
                      maxHeight: 50), // Limit the height for 2 lines
              child: Text(
                widget.description,
                style: const TextStyle(color: Colors.black87),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? "Read less" : "Read more",
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

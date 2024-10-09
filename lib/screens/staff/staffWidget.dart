import 'dart:developer';
import 'package:flutter/material.dart';
import '../../shared/shared_text.dart';
import '../../theme/theme.dart';

class StaffWidget extends StatelessWidget {
  const StaffWidget({
    required this.imgUrl,
    required this.name,
    required this.field,
    required this.experience,
    required this.admin,
    required this.delete,
    super.key,
  });

  final bool admin;
  final String imgUrl;
  final String name;
  final String field;
  final String experience;
  final Function() delete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryColor.withOpacity(0.4),
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          TitleText(name),
          const SizedBox(height: 10),
          BodyText(field), // Updated to show the field
          const SizedBox(height: 20),
          BodyText('Experience: $experience years'), // Added experience
          const SizedBox(height: 20),
          if (admin) // Only show delete option if the user is admin
            GestureDetector(
              onTap: delete,
              child: const Icon(
                Icons.delete,
                size: 30,
                color: AppColors.redColor,
              ),
            )
        ],
      ),
    );
  }
}

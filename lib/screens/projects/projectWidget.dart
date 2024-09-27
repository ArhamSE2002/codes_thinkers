import 'package:flutter/material.dart';

import '../../theme/theme.dart';

Container ProjectWidget(String image, String title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 30),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Container(
          height: 420,
          width: double.infinity,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(15),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: AppColors.secondaryColor,
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}

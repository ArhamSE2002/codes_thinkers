
import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import 'courses_text.dart';

class CoursesCustomCard extends StatelessWidget {
  const CoursesCustomCard(this.title, this.description, this.duration,
      {super.key});
  final String title;
  final String description;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Card(
        color: AppColors.textColor,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 150,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleCText(title),
                      BodyCText(description),
                      const Expanded(child: SizedBox()),
                      const TitleCText("6000/Rs")
                    ],
                  ),
                ),
                const Column(
                  children: [
                    Card(
                      color: AppColors.primaryColor,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: MonthCText("4"),
                        ),
                      ),
                    ),
                    BodyCText("Month"),
                    Expanded(child: SizedBox()),
                    Row(
                      children: [
                        BodyCText("Enroll"),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

// Enum to represent the different attendance states
enum AttendanceStatus { pending, present, absent }

Container AttendanceWidget(String image, String name, String field, String date, String FStatus, AttendanceStatus status) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
    // Conditionally set the height based on the attendance status
    height: status == AttendanceStatus.pending ? 197 : 149,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.secondaryColor, width: 3)),
    child: Column(
      children: [
        ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          minVerticalPadding: 0,
          contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          leading: Container(
            height: 45,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                image: DecorationImage(
                    image: AssetImage(image),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover)),
          ),
          title: Text(
            name,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                fontSize: 24),
          ),
          subtitle: Text(field,
              style: const TextStyle(color: Colors.black54, letterSpacing: 0)),
          trailing: ElevatedButton(
            style: ButtonStyle(
                padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
                backgroundColor: status == AttendanceStatus.pending
                    ? WidgetStatePropertyAll(Colors.yellow[200])
                    : status == AttendanceStatus.present
                    ? const WidgetStatePropertyAll(AppColors.greenColor)
                    : const WidgetStatePropertyAll(AppColors.redColor)),
            onPressed: () {},
            child: Text(
              status == AttendanceStatus.pending
                  ? "Pending"
                  : status == AttendanceStatus.present
                  ? "Present"
                  : "Absent",
              style: TextStyle(
                color: status == AttendanceStatus.pending
                    ? Colors.orange[900]
                    : Colors.white,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.3),
        ),
        Row(
          children: [
            Text(
              "Date",
              style: TextStyle(color: Colors.grey[800]),
            ),
            const SizedBox(width: 10),
            Text(
              date,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              "Fee Status",
              style: TextStyle(color: Colors.grey[800]),
            ),
            const SizedBox(width: 10),
            Text(
              FStatus,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5),
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (status == AttendanceStatus.pending)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Update the status to absent (You can add logic here)
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.redColor)),
                child: Text(
                  "Absent",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Update the status to present (You can add logic here)
                },
                style: const ButtonStyle(
                    backgroundColor:
                    WidgetStatePropertyAll(AppColors.greenColor)),
                child: Text(
                  "Present",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
      ],
    ),
  );
}

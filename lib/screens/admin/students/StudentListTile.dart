import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

Padding studentListTile(
  String image,
  String name,
  String info,
  bool isPaid,
) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: Card(
      color: AppColors.textColor,
      child: ListTile(
        leading: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                image: DecorationImage(
                    image: AssetImage(image),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover))),
        title: Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.w800, fontSize: 20, letterSpacing: 0.5),
        ),
        subtitle: Text(info),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isPaid ? AppColors.greenColor : AppColors.redColor,
          ),
          alignment: Alignment.center,
          height: 40,
          width: isPaid ? 45 : 50,
          child: Text(
            isPaid ? "Paid" : "Unpaid",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    ),
  );
}

import 'package:codes_thinkers/backgroundimage.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

Padding studentListTile(
    String image,
    String name,
    
    bool isPaid, // Always true
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
              image: NetworkImage(image), // Use NetworkImage to load the image from URL
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        trailing: isPaid // Always true
            ?  Container(
          height: 25,
          width: 50,
          alignment: Alignment.center,
          color: Colors.green,
          child: const Text('Paid', style: TextStyle(color: Colors.white,fontSize: 20)),
        )// Green checkmark for paid status
            : Container(
          height: 25,
          width: 65,
          alignment: Alignment.center,
          color: Colors.red,
          child: const Text('Unpaid', style: TextStyle(color: Colors.white,fontSize: 20)),
        ), // Optional for unpaid status
      ),
    ),
);
}

import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  const StyledTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: "Text  ",
      ),
    );
  }
}

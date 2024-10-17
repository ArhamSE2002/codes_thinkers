import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Whatsapps',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
      ),
      body: const Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
        ],
      ),
    );
  }
}
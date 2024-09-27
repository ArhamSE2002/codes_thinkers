
import 'package:flutter/material.dart';

import '../shared/shared_text.dart';
import 'auth/Registration.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  String text =
      "Delivering tailored mobile and web development to transform your ideas into reality.";
  String image = "assets/images/logo.png";
  int onBoard = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Column(
              children: [
                Image.asset(
                  image,
                ),
                const SizedBox(
                  height: 30,
                ),
                HeadlineText(
                  text,
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Row(
              children: [
                onBoard == 1
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            if (onBoard == 1) {
                              setState(() {});
                            }
                            if (onBoard == 2) {
                              onBoard = 1;
                              text =
                                  "Delivering tailored mobile and web development to transform your ideas into reality.";
                              image = "assets/images/logo.png";
                            }
                            if (onBoard == 3) {
                              onBoard = 2;
                              text =
                                  "Empowering businesses with cutting-edge software development and digital transformation.";
                              image = "assets/images/logo.png";
                            }
                          });
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                const Expanded(
                  child: SizedBox(),
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (onBoard == 3) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ),
                          );
                        }
                        if (onBoard == 2) {
                          onBoard = 3;
                          text =
                              "Providing reliable, scalable solutions to help your business thrive in the digital age in digital era.";
                          image = "assets/images/logo.png";
                        }
                        if (onBoard == 1) {
                          onBoard = 2;
                          text =
                              "Empowering businesses with cutting-edge software development and digital transformation.";
                          image = "assets/images/logo.png";
                        }
                      });
                    },
                    child: const Icon(Icons.arrow_forward_ios))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}


import 'dart:async';
import 'package:codes_thinkers/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _iconTranslationAnimation;
  late Animation<Offset> _buttonSlideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

   
    _scaleAnimation = Tween<double>(begin: 0.3, end: 5.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );

    _iconTranslationAnimation = Tween<Offset>(
      begin: const Offset(4, -11),
      end: const Offset(0, 1),   
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

   _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(1, 0), 
      end: const Offset(0, 0),   
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
 Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgroundscreen.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
            
              Positioned(
                top: 0,
                right: 0,
                child: SlideTransition(
                  position: _iconTranslationAnimation, 
                  child: ScaleTransition(
                    scale: _scaleAnimation,  
                    child: SizedBox(
                      height: screenHeight * 0.06, 
                      width: screenWidth * 0.3,   
                      child: Image.asset('assets/images/Icon.JPJ'),
                    ),
                  ),
                ),
              ),
              
              Positioned(
                bottom: screenHeight * 0.02,
                left: screenWidth * 0.8,
                child: SlideTransition(
                  position: _buttonSlideAnimation,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.010,
                        vertical: screenHeight * 0.02,
                      ),
                    ),
                    child: const Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



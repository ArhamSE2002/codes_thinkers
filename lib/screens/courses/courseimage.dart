import 'package:codes_thinkers/backgroundimage.dart';
import 'package:flutter/widgets.dart';

class Courseimage extends StatelessWidget {
  const Courseimage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body:Center(
        child: Container( 
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/imagecourse.jpg'),
            fit: BoxFit.contain,
          ),
        ),

        ),
      ) );
  }
}
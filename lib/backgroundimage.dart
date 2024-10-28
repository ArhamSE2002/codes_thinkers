import 'package:flutter/material.dart';
import 'package:codes_thinkers/theme/theme.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const BackgroundScaffold(
      {super.key,
      required this.body,
      this.appBar,
      FloatingActionButton? floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: Images.backgroundImage,
            fit: BoxFit.fill,
          ),
        ),
        child: body,
      ),
    );
  }
}

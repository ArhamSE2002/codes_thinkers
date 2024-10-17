import 'package:codes_thinkers/screens/splash.dart';
import 'package:codes_thinkers/screens/splashscreenmain.dart';
import 'package:codes_thinkers/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(.8)),
              child: child!);
        },
        debugShowCheckedModeBanner: false,
        theme: primaryTheme,
        home: const Splash());
  }
}

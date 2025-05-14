import 'package:flutter/material.dart';
import 'package:xclone/pages/onboarding/onboarding_screen.dart';

import 'package:xclone/pages/splash/splash_screen.dart';
import 'package:xclone/theme/dark_mode.dart';
import 'package:xclone/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rocket-X',
      theme: lightMode,
      home: const OnboardingScreen(),
    );
  }
}

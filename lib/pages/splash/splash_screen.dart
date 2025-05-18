import 'package:flutter/material.dart';
import 'package:xclone/assets/app_animations.dart';

import 'package:xclone/pages/onboarding/introduction.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    redirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          AppAnimations.splash,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }

  Future<void> redirect() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Introduction()));
  }
}

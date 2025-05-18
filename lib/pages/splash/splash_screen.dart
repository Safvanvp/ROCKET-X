import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
        body: Stack(children: [
          SizedBox.expand(
            child: Lottie.asset(
              AppAnimations.splash,
              fit: BoxFit.cover,
            ),
          ),
        ]));
  }

  Future<void> redirect() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Introduction()));
  }
}

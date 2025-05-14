import 'package:flutter/material.dart';
import 'package:xclone/assets/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.logo, width: 200, height: 200),
      ),
    );
  }
}

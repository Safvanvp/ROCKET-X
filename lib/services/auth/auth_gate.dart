import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:xclone/pages/home_screen.dart';
import 'package:xclone/pages/onboarding/introduction.dart';
import 'package:xclone/pages/splash/splash_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    // Delay splash screen for 2 seconds
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return const SplashScreen();
    }

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return const Introduction();
        }
      },
    );
  }
}

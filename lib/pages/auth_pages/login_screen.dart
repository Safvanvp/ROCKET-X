import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xclone/assets/app_animations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          children: [
            Container(child: Lottie.asset(AppAnimations.login)),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Login',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Wellcome back to the real-world.\nPlease login to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

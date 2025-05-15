import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xclone/assets/app_animations.dart';
import 'package:xclone/components/my_button.dart';
import 'package:xclone/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Lottie.asset(AppAnimations.login,
                width: 250,
                height: 250,
                fit: BoxFit.fill,
                repeat: true,
                animate: true),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Register',
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
              'Wellcome back the real-world.\nPlease register to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            MyTextfield(
                hintText: 'Email',
                obscureText: false,
                controller: emailController),
            const SizedBox(
              height: 20,
            ),
            MyTextfield(
                hintText: 'Name',
                obscureText: false,
                controller: nameController),
            const SizedBox(
              height: 20,
            ),
            MyTextfield(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController),
            const SizedBox(
              height: 20,
            ),
            MyTextfield(
                hintText: 'Confirm Password',
                obscureText: true,
                controller: confirmPasswordController),
            const SizedBox(
              height: 30,
            ),
            MyButton(text: 'Signup'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Alread have a account?,",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                    )),
                const SizedBox(
                  width: 4,
                ),
                Text('login now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xclone/assets/app_animations.dart';
import 'package:xclone/assets/app_images.dart';
import 'package:xclone/components/my_button.dart';
import 'package:xclone/components/my_loginproviders.dart';
import 'package:xclone/components/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              MyTextfield(
                hintText: 'Email',
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextfield(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forget Password?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(text: 'Login'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have a account?,",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      )),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('Register now',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 2,
                    endIndent: 10,
                    indent: 20,
                  )),
                  Text('or with',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  Expanded(
                      child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 2,
                    endIndent: 10,
                    indent: 20,
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: MyLoginproviders(
                      providername: 'Google',
                      image: AppImages.google,
                    ),
                  ),
                  Expanded(
                    child: MyLoginproviders(
                      providername: 'Appele',
                      image: AppImages.apple,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

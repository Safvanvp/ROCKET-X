import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xclone/assets/app_animations.dart';
import 'package:xclone/assets/app_images.dart';
import 'package:xclone/components/my_button.dart';
import 'package:xclone/components/my_loginproviders.dart';
import 'package:xclone/components/my_textfield.dart';
import 'package:xclone/pages/auth/Register.dart';
import 'package:xclone/services/auth/auth_services.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });

  Future<void> login(BuildContext context) async {
    final authServices = AuthServices();

    try {
      await authServices.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _loginkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _loginkey,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  hintText: 'Password',
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
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
                MyButton(
                  text: 'Login',
                  onTap: () {
                    if (_loginkey.currentState!.validate()) {
                      login(context);
                    }
                  },
                ),
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
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text('Register now',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    )
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
      ),
    );
  }
}

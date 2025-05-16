import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xclone/assets/app_animations.dart';
import 'package:xclone/components/my_button.dart';
import 'package:xclone/components/my_textfield.dart';
import 'package:xclone/pages/auth/login_screen.dart';
import 'package:xclone/services/auth/auth_services.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _registerkey = GlobalKey<FormState>();

  void register(BuildContext context)async{
    final authServices = AuthServices();

    try{
      await authServices.signInWithEmailAndPassword(emailController.text, passwordController.text);

    }catch(e){
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
          child: SingleChildScrollView(
        child: Form(
          key: _registerkey,
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
                  hintText: 'Name',
                  obscureText: false,
                  controller: nameController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    if (value.length < 5) {
                      return 'Name must be at least 5 characters';
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
                  validator: (value){
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
                height: 20,
              ),
              MyTextfield(
                  hintText: 'Confirm Password',
                  obscureText: true,
                  controller: confirmPasswordController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password is required';
                    }
                    if (value != passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  
                  },
                  ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                text: 'Signup',
                onTap: () {},
              ),
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
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text('login now',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:xclone/pages/auth/Register.dart';
// import 'package:xclone/pages/auth/login_screen.dart';

// class LoginOrSignup extends StatefulWidget {
//   const LoginOrSignup({super.key});

//   @override
//   State<LoginOrSignup> createState() => _LoginOrSignupState();
// }

// class _LoginOrSignupState extends State<LoginOrSignup> {
//   bool showLoginPAge = true;
//   //toggle between login and register
//   void togglPages() {
//     setState(() {
//       showLoginPAge = !showLoginPAge;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPAge) {
//       return LoginScreen(
//         onTap: togglPages,
//       );
//     } else {
//       return RegisterPage(
//         onTap: togglPages,
        
//       );
//     }
//   }
// }

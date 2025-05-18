import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xclone/firebase_options.dart';

import 'package:xclone/services/auth/auth_gate.dart';

import 'package:xclone/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rocket-X',
      theme: lightMode,
      home: AuthGate(),
    );
  }
}

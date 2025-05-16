import 'package:flutter/material.dart';
import 'package:xclone/services/auth/auth_services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthServices _authServices = AuthServices();

  void _logout(BuildContext context) async {
    _authServices.signOut();
    Navigator.pop(context);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => _logout(context),
        ),
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: const Text('Welcome to the Home Screen!'),
      ),
    );
  }
}

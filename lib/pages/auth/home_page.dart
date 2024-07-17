import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;
  final String password;
  late String message;

  HomePage({super.key, this.message = '',  required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Message: $message'),
            Text('Email: $email'),
            Text('Password: $password'),
          ],
        ),
      ),
    );
  }
}
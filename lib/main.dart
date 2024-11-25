import 'package:flutter/material.dart';

import 'screens/login_screen.dart'; // Ensure this points to your login screen

void main() {
  runApp(ChefinApp());
}

class ChefinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CHEFIN',
      theme: ThemeData(
        fontFamily: 'Coolvetica', // Set the default font to Coolvetica
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(), // Set to your initial screen (like LoginScreen)
    );
  }
}

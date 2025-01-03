import 'package:flutter/material.dart';

import 'screens/login_screen.dart'; // Pastikan ini mengarah ke lokasi yang benar

void main() {
  runApp(const ChefinApp());
}

class ChefinApp extends StatelessWidget {
  const ChefinApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan debug banner
      title: 'CHEFIN',
      theme: ThemeData(
        fontFamily: 'Coolvetica', // Default font diatur ke Coolvetica
        primarySwatch: Colors.green, // Warna utama aplikasi
      ),
      home: LoginScreen(), // Pastikan LoginScreen sudah diimplementasi
    );
  }
}

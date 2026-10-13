import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const DePosylkaApp());
}

class DePosylkaApp extends StatelessWidget {
  const DePosylkaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ДеПосилка',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFBFBFB),
        fontFamily: 'Roboto',
      ),
      home: const LoginScreen(),
    );
  }
}
import 'package:day_05_navigation/screens/contact_list_screen.dart';
import 'package:day_05_navigation/screens/login_screen.dart';
import 'package:flutter/material.dart';
// import 'screens/contacts_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

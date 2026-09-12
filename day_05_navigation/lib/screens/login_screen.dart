// lib/screens/login_screen.dart
import 'package:day_05_navigation/screens/contact_list_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // pushReplacement = Current screen HATAO, naya daalo
                // Ab back button se login pe wapas nahi aa sakte
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactsListScreen(),
                  ),
                );
              },
              child: const Text('Login (Replace)'),
            ),
          ],
        ),
      ),
    );
  }
}

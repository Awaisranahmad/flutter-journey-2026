import 'package:day_05_navigation/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('GO to Detail Screen of user'),
            SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(
                      name: 'Ali',
                      message: 'software developer at karachi',
                    ),
                  ),
                );
              },
              child: const Text('view ali'),
            ),
            SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(name: 'Ahmad', message: 'djsafoij'),
                  ),
                );
              },
              child: const Text('view Ahmad'),
            ),
          ],
        ),
      ),
    );
  }
}

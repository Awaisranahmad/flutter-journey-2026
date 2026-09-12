import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String message;

  const DetailScreen({super.key, required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$name's Detail"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green[100],
              child: Text(
                name[0].toUpperCase(),
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(height: 22),
            Text('Name: $name'),
            SizedBox(height: 22),
            Text(
              message,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

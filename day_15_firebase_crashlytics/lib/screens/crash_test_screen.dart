import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashTestScreen extends StatelessWidget {
  const CrashTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crashlytics Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Test Crashlytics',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // 1. Non-Fatal Error
            ElevatedButton.icon(
              onPressed: () {
                // Ek fake error log karein jo app ko crash NAHI karega
                FirebaseCrashlytics.instance.recordError(
                  Exception('This is a non-fatal custom error'),
                  StackTrace.current,
                  reason: 'User tapped the non-fatal button',
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Non-fatal error logged!')),
                );
              },
              icon: const Icon(Icons.warning, color: Colors.orange),
              label: const Text('Log Non-Fatal Error'),
            ),
            const SizedBox(height: 16),

            // 2. Fatal Error (Crash)
            ElevatedButton.icon(
              onPressed: () {
                // Yeh app ko foran crash kar dega
                FirebaseCrashlytics.instance.crash();
              },
              icon: const Icon(Icons.error, color: Colors.red),
              label: const Text('Force Fatal Crash'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade50,
              ),
            ),
            const SizedBox(height: 16),

            // 3. Set User Identifier
            ElevatedButton.icon(
              onPressed: () {
                // Crashlytics ko batayein ke user kaun hai
                FirebaseCrashlytics.instance.setUserIdentifier("user_12345");
                FirebaseCrashlytics.instance.setCustomKey("role", "admin");

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('User ID set for Crashlytics')),
                );
              },
              icon: const Icon(Icons.person, color: Colors.blue),
              label: const Text('Set User Info'),
            ),
          ],
        ),
      ),
    );
  }
}

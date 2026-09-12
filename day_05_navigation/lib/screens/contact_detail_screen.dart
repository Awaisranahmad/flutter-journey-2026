// lib/screens/contact_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactDetailScreen extends StatelessWidget {
  // ---------- POORA OBJECT RECEIVE KARO ----------
  final Contact contact;

  const ContactDetailScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---------- HEADER ----------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[300]!, Colors.blue[700]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Text(
                      contact.initial,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    contact.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    contact.city,
                    style: const TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ---------- INFO CARDS ----------
            _buildInfoTile(Icons.phone, 'Phone', contact.phone),
            _buildInfoTile(Icons.email, 'Email', contact.email),
            _buildInfoTile(Icons.location_city, 'City', contact.city),
            // body ke andar last mein add karo:
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.star),
                  label: const Text('Mark as Favorite'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    // Pop karte waqt result bhejo
                    Navigator.pop(context, 'favorite');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget (reusable)
  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

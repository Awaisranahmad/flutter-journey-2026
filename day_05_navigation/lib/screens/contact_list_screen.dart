// lib/screens/contacts_list_screen.dart
import 'package:flutter/material.dart';
import '../models/contact.dart';
import 'contact_detail_screen.dart';

class ContactsListScreen extends StatefulWidget {
  const ContactsListScreen({super.key});

  @override
  State<ContactsListScreen> createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {
  // Sample contacts
  final List<Contact> contacts = [
    Contact(
      name: 'Ali Raza',
      phone: '+92 300 1234567',
      email: 'ali@example.com',
      city: 'Karachi',
    ),
    Contact(
      name: 'Fatima Khan',
      phone: '+92 301 7654321',
      email: 'fatima@example.com',
      city: 'Lahore',
    ),
    Contact(
      name: 'Usman Ahmed',
      phone: '+92 302 9876543',
      email: 'usman@example.com',
      city: 'Islamabad',
    ),
    Contact(
      name: 'Ayesha Malik',
      phone: '+92 303 1112222',
      email: 'ayesha@example.com',
      city: 'Peshawar',
    ),
    Contact(
      name: 'Bilal Sheikh',
      phone: '+92 304 4445555',
      email: 'bilal@example.com',
      city: 'Quetta',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Text(
                  contact.initial,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              title: Text(
                contact.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(contact.phone),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),

              // ---------- NAVIGATION WITH OBJECT ----------
              onTap: () async {
                // Navigator.push ka result await karo
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetailScreen(contact: contact),
                  ),
                );

                // Jab wapas aaye, result check karo
                if (result == 'favorite') {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${contact.name} marked as favorite!'),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

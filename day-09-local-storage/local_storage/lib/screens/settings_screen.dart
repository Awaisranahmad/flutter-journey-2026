import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // Helper method to show edit name dialog
  void _showEditNameDialog(BuildContext context) {
    final provider = context.read<SettingsProvider>();
    final controller = TextEditingController(text: provider.settings.userName);

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Your Name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              provider.updateUserName(controller.text);
              Navigator.pop(dialogContext);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SettingsProvider>();

    // Loading state
    if (provider.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final settings = provider.settings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          // ---------- PROFILE SECTION ----------
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: const Text('User Name'),
            subtitle: Text(settings.userName),
            trailing: const Icon(Icons.edit),
            onTap: () => _showEditNameDialog(context),
          ),
          const Divider(),

          // ---------- APPEARANCE SECTION ----------
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Appearance',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          SwitchListTile(
            secondary: Icon(
              settings.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: Colors.blue,
            ),
            title: const Text('Dark Mode'),
            subtitle: Text(settings.isDarkMode ? 'On' : 'Off'),
            value: settings.isDarkMode,
            activeColor: Colors.blue,
            onChanged: (value) => provider.toggleDarkMode(value),
          ),
          const Divider(),

          // ---------- LANGUAGE SECTION ----------
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Language',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.blue),
            title: const Text('Select Language'),
            trailing: DropdownButton<String>(
              value: settings.language,
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(value: 'English', child: Text('English')),
                DropdownMenuItem(value: 'Urdu', child: Text('Urdu')),
                DropdownMenuItem(value: 'Arabic', child: Text('Arabic')),
              ],
              onChanged: (value) {
                if (value != null) {
                  provider.updateLanguage(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

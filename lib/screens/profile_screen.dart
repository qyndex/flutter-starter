import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(radius: 48, child: Icon(Icons.person, size: 48)),
          const SizedBox(height: 16),
          Text('Jane Doe', textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall),
          Text('jane@example.com', textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
          const Divider(height: 32),
          ListTile(leading: const Icon(Icons.settings), title: const Text('Settings')),
          ListTile(leading: const Icon(Icons.help_outline), title: const Text('Help & Support')),
          ListTile(leading: const Icon(Icons.logout), title: const Text('Sign Out')),
        ],
      ),
    );
  }
}

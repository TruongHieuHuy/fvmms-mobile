import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Tài khoản'),
              onTap: () {
                // Navigate to profile page
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Thông báo'),
              onTap: () {
                // Navigate to notification settings page
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
            child: ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Bảo mật'),
              onTap: () {
                // Navigate to security page
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Ngôn ngữ'),
              onTap: () {
                // Navigate to language settings
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Về chúng tôi'),
              onTap: () {
                // Show about dialog
              },
            ),
          ),
          const Divider(),
          Card(
            margin: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
            child: ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text('Đăng xuất', style: TextStyle(color: Colors.red)),
              onTap: () {
                // Handle logout
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bản đồ & Thời tiết'),
        backgroundColor: Colors.blue.shade600,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_on, size: 72, color: Colors.blue),
              const SizedBox(height: 12),
              const Text(
                'Bản đồ và thông tin thời tiết sẽ được hiển thị ở đây.',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Lấy vị trí...'))),
                child: const Text('Lấy vị trí hiện tại'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

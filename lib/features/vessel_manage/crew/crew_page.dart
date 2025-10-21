import 'package:flutter/material.dart';

// Data model for a crew member
class CrewMember {
  final String name;
  final String position;
  final String phone;

  CrewMember({required this.name, required this.position, required this.phone});
}

class CrewManagementPage extends StatefulWidget {
  const CrewManagementPage({super.key});

  @override
  State<CrewManagementPage> createState() => _CrewManagementPageState();
}

class _CrewManagementPageState extends State<CrewManagementPage> {
  // Dummy data
  final List<CrewMember> _crewMembers = [
    CrewMember(
      name: 'Trần Văn B',
      position: 'Thuyền trưởng',
      phone: '090-123-4567',
    ),
    CrewMember(name: 'Lê Thị C', position: 'Thuyền phó', phone: '091-234-5678'),
    CrewMember(name: 'Phạm Văn D', position: 'Thủy thủ', phone: '092-345-6789'),
    CrewMember(
      name: 'Nguyễn Thị E',
      position: 'Thủy thủ',
      phone: '093-456-7890',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách thuyền viên'),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _crewMembers.length,
        itemBuilder: (context, index) {
          final member = _crewMembers[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: const Icon(Icons.person, color: Colors.blue),
              ),
              title: Text(
                member.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(member.position),
              trailing: IconButton(
                icon: const Icon(Icons.phone, color: Colors.green),
                onPressed: () {
                  // TODO: Implement call functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Gọi cho ${member.name}')),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add crew member functionality
        },
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// Data model for a document
class Document {
  final String name;
  final DateTime expiryDate;
  final String type;

  Document({required this.name, required this.expiryDate, required this.type});

  bool get isExpired => DateTime.now().isAfter(expiryDate);
  Duration get expiresIn => expiryDate.difference(DateTime.now());
}

class VesselDocumentsPage extends StatefulWidget {
  const VesselDocumentsPage({super.key});

  @override
  State<VesselDocumentsPage> createState() => _VesselDocumentsPageState();
}

class _VesselDocumentsPageState extends State<VesselDocumentsPage> {
  // Dummy data
  final List<Document> _documents = [
    Document(name: 'Giấy chứng nhận đăng ký tàu cá', expiryDate: DateTime(2026, 12, 31), type: 'Giấy phép'),
    Document(name: 'Giấy phép khai thác thủy sản', expiryDate: DateTime(2025, 6, 15), type: 'Giấy phép'),
    Document(name: 'Bảo hiểm tàu', expiryDate: DateTime(2024, 11, 20), type: 'Bảo hiểm'),
    Document(name: 'Giấy chứng nhận an toàn kỹ thuật', expiryDate: DateTime(2025, 8, 1), type: 'Kiểm định'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giấy phép của tàu'),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _documents.length,
        itemBuilder: (context, index) {
          final doc = _documents[index];
          final statusColor = doc.isExpired ? Colors.red : (doc.expiresIn.inDays < 30 ? Colors.orange : Colors.green);
          final statusText = doc.isExpired ? 'Hết hạn' : (doc.expiresIn.inDays < 30 ? 'Sắp hết hạn' : 'Còn hạn');

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              leading: CircleAvatar(
                backgroundColor: statusColor.withOpacity(0.1),
                child: Icon(Icons.description, color: statusColor),
              ),
              title: Text(doc.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Hết hạn: ${doc.expiryDate.day}/${doc.expiryDate.month}/${doc.expiryDate.year}'),
              trailing: Chip(
                label: Text(statusText, style: const TextStyle(color: Colors.white, fontSize: 12)),
                backgroundColor: statusColor,
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add document functionality
        },
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}

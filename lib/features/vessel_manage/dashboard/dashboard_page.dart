import 'package:flutter/material.dart';
import '../information/information_page.dart';
import '../documents/documents_page.dart';
import '../crew/crew_page.dart';

class VesselDashboardPage extends StatelessWidget {
  const VesselDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tổng quan hồ sơ tàu'),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSummaryCard(),
          const SizedBox(height: 24),

          // Navigation Buttons
          _buildNavigationButton(
            context,
            title: 'Thông tin tàu',
            icon: Icons.info_outline,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const VesselInformationPage()));
            },
          ),
          const SizedBox(height: 16),
          _buildNavigationButton(
            context,
            title: 'Giấy phép của tàu',
            icon: Icons.description_outlined,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const VesselDocumentsPage()));
            },
          ),
          const SizedBox(height: 16),
          _buildNavigationButton(
            context,
            title: 'Danh sách thuyền viên',
            icon: Icons.people_alt_outlined,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CrewManagementPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tàu đánh cá 01', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 8),
            Text('Mã số: 12345', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
            const Divider(height: 24, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryItem(icon: Icons.description, value: '4', label: 'Giấy phép'),
                _buildSummaryItem(icon: Icons.people, value: '4', label: 'Thuyền viên'),
                _buildSummaryItem(icon: Icons.warning_amber_rounded, value: '1', label: 'Sắp hết hạn'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem({required IconData icon, required String value, required String label}) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue.shade800, size: 32),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      ],
    );
  }

  Widget _buildNavigationButton(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.blue[800], size: 28),
              const SizedBox(width: 20),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

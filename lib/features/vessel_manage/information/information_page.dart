import 'package:flutter/material.dart';

class VesselInformationPage extends StatelessWidget {
  const VesselInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Thông tin tàu'),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildInfoCard(
            context,
            title: 'Thông tin cơ bản',
            icon: Icons.info_outline,
            children: [
              _buildInfoTile(
                icon: Icons.confirmation_number_outlined,
                label: 'Mã số tàu',
                value: '12345',
              ),
              _buildInfoTile(
                icon: Icons.directions_boat_outlined,
                label: 'Tên tàu',
                value: 'Tàu đánh cá 01',
              ),
              _buildInfoTile(
                icon: Icons.person_outline,
                label: 'Chủ tàu',
                value: 'Nguyễn Văn A',
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildInfoCard(
            context,
            title: 'Chi tiết kỹ thuật',
            icon: Icons.settings_outlined,
            children: [
              _buildInfoTile(
                icon: Icons.straighten_outlined,
                label: 'Chiều dài',
                value: '12m',
              ),
              _buildInfoTile(
                icon: Icons.power_settings_new_outlined,
                label: 'Công suất động cơ',
                value: '200 HP',
              ),
              _buildInfoTile(
                icon: Icons.build_circle_outlined,
                label: 'Năm sản xuất',
                value: '2020',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue[800]),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

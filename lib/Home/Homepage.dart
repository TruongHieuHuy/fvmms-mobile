import 'package:flutter/material.dart';
import 'package:quanlytauca/features/dashboard/dashboard_screen.dart';
import 'package:quanlytauca/features/trip_management/trip_list_page.dart';
import 'package:quanlytauca/features/vessel_manage/dashboard/dashboard_page.dart';
import '../features/map_weather/Maps.dart';
import '../features/fishing_logbook/logbook.dart';
import '../features/notifications/General.dart';
import 'package:quanlytauca/features/drawer/drawer.dart';
import './setting.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý tàu cá'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const GeneralNotificationPage(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const DashboardScreen(),
          const SizedBox(height: 24),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildFunctionCard(
                context,
                icon: Icons.explore, // Information Trip
                title: 'Thông tin\nChuyến đi',
                color: Colors.blue.shade600,
                onTap: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const TripListPage())),
              ),
              _buildFunctionCard(
                context,
                icon: Icons.article, // Fish Logbook
                title: 'Nhật Ký\nKhai Thác',
                color: Colors.blue.shade600,
                onTap: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const LogbookPage())),
              ),
              _buildFunctionCard(
                context,
                icon: Icons.location_on, // Bản đồ & Thời tiết
                title: 'Bản đồ\n& Thời tiết',
                color: Colors.blue.shade600,
                onTap: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const MapsPage())),
              ),
              _buildFunctionCard(
                context,
                icon: Icons.directions_boat, // Hồ sơ tàu
                title: 'Hồ sơ tàu',
                color: Colors.blue.shade600,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const VesselDashboardPage(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFunctionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Chức năng "$feature" đang phát triển'),
        backgroundColor: Colors.blue.shade600,
      ),
    );
  }
}

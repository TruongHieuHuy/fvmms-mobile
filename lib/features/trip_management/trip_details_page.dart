import 'package:flutter/material.dart';
import 'trip_model.dart';

class TripDetailsPage extends StatelessWidget {
  final Trip trip;

  const TripDetailsPage({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.name),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildDetailCard(icon: Icons.directions_boat, title: 'Tên tàu', subtitle: trip.shipName),
            _buildDetailCard(icon: Icons.person, title: 'Thuyền trưởng', subtitle: trip.captain),
            _buildDetailCard(icon: Icons.calendar_today, title: 'Ngày khởi hành', subtitle: trip.date),
            _buildDetailCard(icon: Icons.location_on, title: 'Cảng đi', subtitle: trip.port),
            _buildDetailCard(icon: Icons.group, title: 'Số thuyền viên', subtitle: trip.crewCount.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({required IconData icon, required String title, required String subtitle}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[900]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}

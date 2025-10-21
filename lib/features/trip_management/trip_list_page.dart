import 'package:flutter/material.dart';
import 'create_trip_page.dart';
import 'trip_details_page.dart';
import 'trip_model.dart';

class TripListPage extends StatefulWidget {
  const TripListPage({super.key});

  @override
  State<TripListPage> createState() => _TripListPageState();
}

class _TripListPageState extends State<TripListPage> {
  // Dummy data - now using the Trip class from trip_model.dart
  final List<Trip> trips = [
    Trip(
      name: 'Chuyến đi hiện tại',
      date: '14/10/2025',
      port: 'Cảng Vũng Tàu',
      isCurrent: true,
      shipName: 'Tàu 001',
      captain: 'Nguyễn Văn A',
      crewCount: 10,
    ),
    Trip(
      name: 'Chuyến đi 001',
      date: '09/10/2025',
      returnDate: '20/10/2025',
      port: 'Cảng Cát Lái',
      shipName: 'Tàu 002',
      captain: 'Trần Văn B',
      crewCount: 8,
    ),
    Trip(
      name: 'Chuyến đi 002',
      date: '15/09/2025',
      returnDate: '25/09/2025',
      port: 'Cảng Hải Phòng',
      shipName: 'Tàu 003',
      captain: 'Lê Thị C',
      crewCount: 12,
    ),
    Trip(
      name: 'Chuyến đi 003',
      date: '20/08/2025',
      returnDate: '30/08/2025',
      port: 'Cảng Đà Nẵng',
      shipName: 'Tàu 004',
      captain: 'Phạm Văn D',
      crewCount: 9,
    ),
  ];

  Trip? get currentTrip => trips.firstWhere((t) => t.isCurrent);
  List<Trip> get pastTrips => trips.where((t) => !t.isCurrent).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý chuyến đi'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCurrentTripCard(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text('Chuyến đi đã qua', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: _buildPastTripsList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTripPage()),
          );
        },
        label: const Text('Tạo chuyến đi mới'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildCurrentTripCard() {
    final trip = currentTrip;
    if (trip == null) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Text('Không có chuyến đi nào hiện tại.'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CreateTripPage()),
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  foregroundColor: Colors.white,
                ),
                child: const Text('Bắt đầu chuyến đi mới'),
              )
            ],
          ),
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TripDetailsPage(trip: trip)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(trip.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(trip.date),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(trip.port),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Xem chi tiết', style: TextStyle(color: Colors.blueAccent)),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.blueAccent),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPastTripsList() {
    if (pastTrips.isEmpty) {
      return const Center(child: Text('Không có chuyến đi nào đã qua.'));
    }
    return ListView.builder(
      itemCount: pastTrips.length,
      itemBuilder: (context, index) {
        final trip = pastTrips[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: ListTile(
            title: Text(trip.port, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Đi: ${trip.date} - Về: ${trip.returnDate ?? 'Chưa có'}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TripDetailsPage(trip: trip)),
              );
            },
          ),
        );
      },
    );
  }
}

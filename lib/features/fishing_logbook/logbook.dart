import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'detaillogbook.dart';
import 'log_entry_model.dart';

class LogbookPage extends StatefulWidget {
  const LogbookPage({super.key});

  @override
  State<LogbookPage> createState() => _LogbookPageState();
}

class _LogbookPageState extends State<LogbookPage> {
  // Placeholder for log entries
  final List<LogEntry> _logEntries = [
    LogEntry(id: '1', dateTime: DateTime.now().subtract(const Duration(days: 2, hours: 2)), latitude: 10.7769, longitude: 106.7009, species: 'Cá ngừ', quantity: 150.5),
    LogEntry(id: '2', dateTime: DateTime.now().subtract(const Duration(days: 2, hours: 5)), latitude: 10.775, longitude: 106.702, species: 'Cá thu', quantity: 80.0),
    LogEntry(id: '3', dateTime: DateTime.now().subtract(const Duration(days: 1, hours: 8)), latitude: 10.778, longitude: 106.705, species: 'Cá hồng', quantity: 120.2),
    LogEntry(id: '4', dateTime: DateTime.now().subtract(const Duration(days: 1, hours: 4)), latitude: 10.778, longitude: 106.705, species: 'Cá Basa', quantity: 220.0),
    LogEntry(id: '5', dateTime: DateTime.now().subtract(const Duration(hours: 5)), latitude: 10.775, longitude: 106.702, species: 'Cá Bạc Má', quantity: 75.0),
    LogEntry(id: '6', dateTime: DateTime.now().subtract(const Duration(hours: 2)), latitude: 10.778, longitude: 106.705, species: 'Cá Mực', quantity: 200.0),
  ];

  @override
  void initState() {
    super.initState();
    _logEntries.sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }

  void _navigateAndAddEntry() async {
    final newEntry = await Navigator.of(context).push<LogEntry>(
      MaterialPageRoute(builder: (_) => const DetailLogBook()),
    );
    if (newEntry != null) {
      setState(() {
        _logEntries.add(newEntry);
        _logEntries.sort((a, b) => b.dateTime.compareTo(a.dateTime));
      });
    }
  }

  void _navigateAndEditEntry(LogEntry entry) async {
    final updatedEntry = await Navigator.of(context).push<LogEntry>(
      MaterialPageRoute(builder: (_) => DetailLogBook(logEntry: entry)),
    );
    if (updatedEntry != null) {
      setState(() {
        final index = _logEntries.indexWhere((e) => e.id == updatedEntry.id);
        if (index != -1) {
          _logEntries[index] = updatedEntry;
          _logEntries.sort((a, b) => b.dateTime.compareTo(a.dateTime));
        }
      });
    }
  }

  Map<DateTime, List<LogEntry>> _groupEntriesByDay() {
    final Map<DateTime, List<LogEntry>> grouped = {};
    for (final entry in _logEntries) {
      final date = DateTime(entry.dateTime.year, entry.dateTime.month, entry.dateTime.day);
      if (grouped[date] == null) {
        grouped[date] = [];
      }
      grouped[date]!.add(entry);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final groupedEntries = _groupEntriesByDay();
    final sortedDates = groupedEntries.keys.toList()..sort((a, b) => b.compareTo(a));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhật ký Khai thác'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: sortedDates.length,
        itemBuilder: (context, index) {
          final date = sortedDates[index];
          final entriesForDay = groupedEntries[date]!;
          
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ExpansionTile(
              title: Text(
                'Ngày ${DateFormat('dd/MM/yyyy').format(date)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${entriesForDay.length} lần đánh bắt'),
              children: entriesForDay.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () => _navigateAndEditEntry(entry),
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    entry.species,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${entry.quantity} kg',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue[800],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Divider(),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                Text(
                                  DateFormat('HH:mm').format(entry.dateTime),
                                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                Text(
                                  '${entry.latitude.toStringAsFixed(4)}, ${entry.longitude.toStringAsFixed(4)}',
                                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateAndAddEntry,
        backgroundColor: Colors.blue[900],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

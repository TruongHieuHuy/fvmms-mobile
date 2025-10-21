class LogEntry {
  final String id;
  final DateTime dateTime;
  final double latitude;
  final double longitude;
  final String species;
  final double quantity;

  LogEntry({
    required this.id,
    required this.dateTime,
    required this.latitude,
    required this.longitude,
    required this.species,
    required this.quantity,
  });
}

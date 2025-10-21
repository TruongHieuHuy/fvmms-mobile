class Trip {
  final String name;
  final String date;
  final String? returnDate; // Added returnDate
  final String port;
  final String captain;
  final String shipName;
  final int crewCount;
  final bool isCurrent;

  Trip({
    required this.name,
    required this.date,
    this.returnDate,
    required this.port,
    required this.captain,
    required this.shipName,
    required this.crewCount,
    this.isCurrent = false,
  });
}

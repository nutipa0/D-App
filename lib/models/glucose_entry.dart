class GlucoseEntry {
  final DateTime date;
  final double value;
  final String? notes;

  const GlucoseEntry({required this.date, required this.value, this.notes});
}

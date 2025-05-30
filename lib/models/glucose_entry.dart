import 'package:d_app/screens/add_entry_screen.dart';

class GlucoseEntry {
  final DateTime date;
  final double value;
  final MeasureUnit unit;
  final String? notes;

  const GlucoseEntry({required this.date, required this.value, required this.unit, this.notes});
}

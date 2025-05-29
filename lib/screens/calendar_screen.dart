import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100.0),
      //   child: BackdropFilter(
      //     filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      //     child: AppBar(
      //       backgroundColor: Colors.transparent.withValues(alpha: 0.3),
      //     ),
      //   ),
      // ),
      appBar: AppBar(title: Text('Календарь'), elevation: 10),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Selected Day: ${today.toString().split(" ")[0]}'),
            Container(
              child: TableCalendar(
                // locale: "ru_RU",
                rowHeight: 43,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2019, 10, 18),
                lastDay: DateTime.utc(2030, 4, 20),
                pageAnimationDuration: Duration(milliseconds: 400),
                onDaySelected: _onDaySelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

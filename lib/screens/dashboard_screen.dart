import 'package:d_app/models/glucose_entry.dart';
import 'package:d_app/screens/add_entry_screen.dart';
import 'package:d_app/utils/general_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<GlucoseEntry> glucoseData = [
    GlucoseEntry(date: DateTime.now().subtract(Duration(hours: 4)), value: 5.4),
    GlucoseEntry(date: DateTime.now().subtract(Duration(hours: 2)), value: 6.1),
    GlucoseEntry(date: DateTime.now(), value: 5.8),
  ];

  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GeneralTheme.primary,
        title: Text(
          glucoseData.isNotEmpty
              ? 'Текущий уровень: ${glucoseData.last.value.toStringAsFixed(1)}'
              : 'Нет данных',
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed:
                () => Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => AddEntryScreen()),
                ),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                const Text('Ваш тип диабета', style: GeneralTheme.titleStyle),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioListTile<int>(
                      activeColor: GeneralTheme.primary,
                      title: const Text('1 Тип'),
                      value: 1,
                      groupValue: _selectedValue,
                      onChanged: (value) => updateValue(value),
                    ),
                    RadioListTile<int>(
                      activeColor: GeneralTheme.primary,
                      title: const Text('2 Тип'),
                      value: 2,
                      groupValue: _selectedValue,
                      onChanged: (value) => updateValue(value),
                    ),

                    const SizedBox(height: 20),

                    generalButton(() {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 5),
                          content: Row(
                            children: [
                              Icon(
                                Icons.check_circle_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),

                              const SizedBox(width: 10),

                              const Text(
                                'Сохранено! Вы также можете изменить свой вариант в настройках',
                              ),
                            ],
                          ),
                        ),
                      );
                    }, 'Сохранить вариант'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            Text('Информация за сегодня', style: GeneralTheme.titleStyle),

            Expanded(
              child: ListView.builder(
                itemCount: glucoseData.length,
                itemBuilder: (context, index) {
                  final entry = glucoseData[index];
                  return ListTile(
                    title: Text('${entry.value.toStringAsFixed(1)} ммоль/л'),
                    subtitle: Text(DateFormat('HH:mm').format(entry.date)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: GeneralTheme.primary,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => AddEntryScreen()),
          );

          if (result != null && result is GlucoseEntry) {
            setState(() {
              glucoseData.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ElevatedButton generalButton(Function()? onPressed, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: GeneralTheme.primary),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: GeneralTheme.secondary)),
    );
  }

  void updateValue(int? value) {
    setState(() {
      _selectedValue = value;
    });
  }
}

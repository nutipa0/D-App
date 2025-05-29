import 'package:d_app/screens/calendar_screen.dart';
import 'package:d_app/screens/dashboard_screen.dart';
import 'package:d_app/screens/settings_screen.dart';
import 'package:d_app/utils/general_theme.dart';
import 'package:flutter/material.dart';

class SecondNavigation extends StatefulWidget {
  const SecondNavigation({super.key});

  @override
  State<SecondNavigation> createState() => _SecondNavigationState();
}

class _SecondNavigationState extends State<SecondNavigation> {
  final List<Widget> _screens = const [
    DashboardScreen(),
    CalendarScreen(),
    SettingsScreen(),
  ];

  final List<BottomNavigationBarItem> _destinations = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_rounded),
      label: 'Календарь',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Настройки'),
  ];
  int _currentScreenIndex = 0;

  void _toggleBottomNavigation(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _destinations,
        currentIndex: _currentScreenIndex,
        selectedItemColor: GeneralTheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _toggleBottomNavigation,
      ),
      body: _screens[_currentScreenIndex],
    );
  }
}

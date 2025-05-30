import 'package:d_app/screens/add_entry_screen.dart';
import 'package:d_app/screens/calendar_screen.dart';
import 'package:d_app/screens/dashboard_screen.dart';
import 'package:d_app/screens/settings_screen.dart';
import 'package:d_app/utils/general_theme.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final List<Widget> _screens = const [
    DashboardScreen(),
    // AddEntryScreen(),
    CalendarScreen(),
    SettingsScreen(),
  ];

  final List<NavigationDestination> _destinations = const [
    NavigationDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: 'Главная',
    ),
    // NavigationDestination(
    //   selectedIcon: Icon(Icons.add),
    //   icon: Icon(Icons.add_outlined),
    //   label: 'Добавить запись',
    // ),
    NavigationDestination(selectedIcon: Icon(Icons.calendar_month), icon: Icon(Icons.calendar_month_outlined), label: 'Календарь'),
    NavigationDestination(
      selectedIcon: Icon(Icons.settings),
      icon: Icon(Icons.settings_outlined),
      label: 'Настройки',
    ),
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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _toggleBottomNavigation,
        indicatorColor: GeneralTheme.primary,
        selectedIndex: _currentScreenIndex,
        destinations: _destinations,
      ),
      body: _screens[_currentScreenIndex],
    );
  }
}

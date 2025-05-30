import 'package:d_app/main_navigation.dart';
// import 'package:d_app/second_navigation.dart';
import 'package:d_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  // final bool isDarkMode;

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D_APP',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const MainNavigation(),
    );
  }
}

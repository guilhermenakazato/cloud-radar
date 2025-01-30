import 'package:cloud_radar/screens/start_screen.dart';
import 'package:cloud_radar/theme/application_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ApplicationThemes.defaultTheme,
      title: 'Cloud Radar',
      home: Scaffold(
        body: StartScreen()
      ),
    );
  }
}

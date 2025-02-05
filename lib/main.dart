import 'package:cloud_radar/screens/start_screen.dart';
import 'package:cloud_radar/theme/application_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CloudRadar());
}

class CloudRadar extends StatelessWidget {
  const CloudRadar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ApplicationThemes.defaultTheme,
      title: 'Cloud Radar',
      themeMode: ThemeMode.dark,
      home: const StartScreen(),
    );
  }
}

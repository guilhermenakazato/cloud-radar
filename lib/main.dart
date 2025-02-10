import 'package:cloud_radar/screens/start_screen.dart';
import 'package:cloud_radar/theme/application_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const CloudRadar());
}

class CloudRadar extends StatefulWidget {
  const CloudRadar({super.key});

  @override
  State<CloudRadar> createState() => _CloudRadarState();
}

class _CloudRadarState extends State<CloudRadar> {
  final List<String> imagesToPreload = [
    "assets/presentation1.png",
    "assets/presentation2-1.png",
    "assets/presentation3-1.png",
    "assets/presentation4.png",
  ];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _precacheImages();
    FlutterNativeSplash.remove();
  }

  Future<void> _precacheImages() async {
    for (var image in imagesToPreload) {
      await precacheImage(AssetImage(image), context);
    }
  }

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

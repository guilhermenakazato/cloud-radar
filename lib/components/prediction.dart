import 'package:flutter/material.dart';

class Prediction extends StatelessWidget {
  const Prediction({
    super.key,
    required this.iconPath,
    required this.day,
    required this.temperature,
    required this.temperatureScale,
  });

  final String iconPath;
  final String day;
  final int temperature;
  final String temperatureScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.2,
      height: MediaQuery.sizeOf(context).height * 0.11,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day),
          Image.asset(iconPath),
          Text("$temperature°$temperatureScale"),
        ],
      ),
    );
  }
}

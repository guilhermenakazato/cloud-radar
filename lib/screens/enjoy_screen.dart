import 'package:cloud_radar/screens/main_screen.dart';
import 'package:cloud_radar/utils/navigate.dart';
import 'package:flutter/material.dart';

class EnjoyScreen extends StatelessWidget {
  const EnjoyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/presentation4.png",
              ),
              Row(
                children: [
                  Text(
                    "Aproveite!",
                  ),
                  Text(
                    "4/4",
                  ),
                ],
              ),
              Text(
                "Esse é o fim do nosso Onboarding. Aproveite nosso aplicativo, lembre-se estamos na versão beta.",
              ),
            ],
          ),
          TextButton(
            child: Text("Ir para tela inicial"),
            onPressed: () {
              Navigate.to(context, MainScreen());
            },
          ),
        ],
      ),
    );
  }
}

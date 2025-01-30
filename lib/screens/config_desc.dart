import 'package:cloud_radar/screens/enjoy_screen.dart';
import 'package:cloud_radar/utils/navigate.dart';
import 'package:flutter/material.dart';

class ConfigDesc extends StatelessWidget {
  const ConfigDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/presentation3-1.png",
          ),
          Row(
            children: [
              Text(
                "Configurações",
              ),
              Text("3/4")
            ],
          ),
          Text(
            "Você possuirá informações essenciais para customizar da forma desejada. As configurações disponíveis são simples, mas potentes!",
          ),
          Image.asset(
            "assets/presentation3-2.png",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigate.goBack(context);
                },
                child: Text(
                  "Voltar",
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigate.to(context, EnjoyScreen());
                },
                child: Text(
                  "Próximo",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

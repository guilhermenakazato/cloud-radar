import 'package:cloud_radar/screens/config_desc.dart';
import 'package:cloud_radar/utils/navigate.dart';
import 'package:flutter/material.dart';

class FirstScreenDesc extends StatelessWidget {
  const FirstScreenDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: OverflowBox(
              alignment: Alignment.centerLeft,
              maxWidth: double.infinity,
              child: Row(
                children: [
                  Hero(
                    tag: "image-2",
                    child: Image.asset(
                      "assets/presentation2-1.png",
                    ),
                  ),
                  Hero(
                    tag: "image-3",
                    child: Image.asset(
                      "assets/presentation3-1.png",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "Primeira tela",
              ),
              Text("2/4")
            ],
          ),
          Text(
            "A tela principal é composta por informações, como temperatura, sensação térmica, umidade e muito mais informações",
          ),
          Image.asset(
            "assets/presentation2-2.png",
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
                  Navigate.to(context, ConfigDesc());
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

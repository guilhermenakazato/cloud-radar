import 'package:cloud_radar/screens/enjoy_screen.dart';
import 'package:cloud_radar/screens/first_screen_desc.dart';
import 'package:cloud_radar/utils/navigate.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Image.asset(
              "assets/presentation1.png",
            ),
            Row(
              children: [Text("Opa!",), Text("1/4",)],
            ),
            Text(
              "Bom, aqui é uma etapa rápida. Você entendera informações básicas e diretas sobre o tempo em sua região, ou a qual você deseja.",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigate.to(context, EnjoyScreen());
              },
              child: Text("Pular tutorial"),
            ),
            TextButton(
              onPressed: () {
                Navigate.to(context, FirstScreenDesc());
              },
              child: Text("Iniciar"),
            ),
          ],
        )
      ],
    );
  }
}

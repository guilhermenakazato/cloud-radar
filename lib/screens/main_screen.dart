import 'package:cloud_radar/components/prediction.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/rainbg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Text(
                          "Água Clara - MS",
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                          children: [
                            Text("Segunda 16 de Dezembro"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("30°"),
                                Text("C"),
                              ],
                            ),
                            Image.asset("assets/icons/rain.png"),
                            Text("Tempo chuvoso"),
                            Text("Chuvinha boa"),
                          ],
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/icons/wind.png"),
                                Text("2.60 Km/h Norte"),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset("assets/icons/humidity.png"),
                                Text("Umidade 73%"),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/thermal-sensation.png",
                                ),
                                Text(
                                  "Sensação de 26°",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: [
                      //       Prediction(
                      //         day: "Hoje",
                      //         iconPath: "assets/icons/rain.png",
                      //         temperature: 30,
                      //         temperatureScale: "C",
                      //       ),
                      //       Prediction(
                      //         day: "Amanhã",
                      //         iconPath: "assets/icons/sunny.png",
                      //         temperature: 30,
                      //         temperatureScale: "C",
                      //       ),
                      //       Prediction(
                      //         day: "18/12",
                      //         iconPath: "assets/icons/cloudy.png",
                      //         temperature: 32,
                      //         temperatureScale: "C",
                      //       ),
                      //       Prediction(
                      //         day: "19/12",
                      //         iconPath: "assets/icons/melting.png",
                      //         temperature: 42,
                      //         temperatureScale: "C",
                      //       ),
                      //       Prediction(
                      //         day: "20/12",
                      //         iconPath: "assets/icons/cloudy.png",
                      //         temperature: 34,
                      //         temperatureScale: "C",
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Row(
                      //   children: [
                      //     TextField(
                      //       decoration: InputDecoration(
                      //         prefixIcon: Image.asset("assets/icons/map.png"),
                      //         suffixIcon: Image.asset("assets/icons/search.png"),
                      //       ),
                      //     ),
                      //     IconButton(
                      //       onPressed: () {},
                      //       icon: Image.asset(
                      //         "assets/icons/settings.png",
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

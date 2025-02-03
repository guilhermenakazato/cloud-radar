import 'package:cloud_radar/components/prediction.dart';
import 'package:cloud_radar/screens/config_screen.dart';
import 'package:cloud_radar/theme/cloud_radar_icons.dart';
import 'package:cloud_radar/utils/navigate.dart';
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Icon(CloudRadarIcons.chuva),
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
                                Icon(CloudRadarIcons.vento),
                                Text("2.60 Km/h Norte"),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(CloudRadarIcons.umidade),
                                Text("Umidade 73%"),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(CloudRadarIcons.sensacao),
                                Text(
                                  "Sensação de 26°",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.sizeOf(context).height * 0.04,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                spacing: 8,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Prediction(
                                    day: "Hoje",
                                    icon: CloudRadarIcons.chuva,
                                    temperature: 30,
                                    temperatureScale: "C",
                                  ),
                                  Prediction(
                                    day: "Amanhã",
                                    icon: CloudRadarIcons.sol,
                                    temperature: 30,
                                    temperatureScale: "C",
                                  ),
                                  Prediction(
                                    day: "18/12",
                                    icon: CloudRadarIcons.solComNuvens,
                                    temperature: 32,
                                    temperatureScale: "C",
                                  ),
                                  Prediction(
                                    day: "19/12",
                                    icon: CloudRadarIcons.inferno,
                                    temperature: 42,
                                    temperatureScale: "C",
                                  ),
                                  Prediction(
                                    day: "20/12",
                                    icon: CloudRadarIcons.solComNuvens,
                                    temperature: 34,
                                    temperatureScale: "C",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    CloudRadarIcons.mapa,
                                  ),
                                  suffixIcon: Icon(
                                    CloudRadarIcons.procurar,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: IconButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll<Color>(
                                      Colors.black,
                                    ),
                                    padding: WidgetStatePropertyAll<
                                        EdgeInsetsGeometry>(
                                      EdgeInsets.all(16),
                                    ),
                                    shape: WidgetStatePropertyAll<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),),
                                onPressed: () {
                                  Navigate.to(context, ConfigScreen());
                                },
                                icon: Icon(CloudRadarIcons.configuracao),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

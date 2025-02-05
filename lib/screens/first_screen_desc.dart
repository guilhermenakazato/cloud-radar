import 'package:cloud_radar/components/filled_cloud_button.dart';
import 'package:cloud_radar/components/outlined_cloud_button.dart';
import 'package:cloud_radar/screens/config_desc.dart';
import 'package:cloud_radar/theme/application_colors.dart';
import 'package:cloud_radar/utils/navigate.dart';
import 'package:flutter/material.dart';

class FirstScreenDesc extends StatelessWidget {
  const FirstScreenDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.orange100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: const OverflowBox(
              alignment: Alignment.centerLeft,
              maxWidth: double.infinity,
              child: Row(
                children: [
                  Hero(
                    tag: "image-2",
                    child: Image(
                      image: AssetImage(
                        "assets/presentation2-1.png",
                      ),
                    ),
                  ),
                  Hero(
                    tag: "image-3",
                    child: Image(
                      image: AssetImage(
                        "assets/presentation3-1.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 30,
                left: 12,
                right: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 10,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                        child: const Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Primeira tela",
                              style: TextStyle(
                                fontFamily: "DM Sans",
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                decorationColor: ApplicationColors.orange500,
                                color: ApplicationColors.orange500,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "2/4",
                                style: TextStyle(
                                  fontFamily: "DM Sans",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: ApplicationColors.orange500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "A tela principal é composta por informações, como temperatura, sensação térmica, umidade e muito mais informações.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ApplicationColors.black900,
                          fontFamily: "DM Sans",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/presentation2-2.png",
                  ),
                  Row(
                    spacing: 2,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedCloudButton(
                          text: "Voltar",
                          onPressed: () {
                            Navigate.goBack(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: FilledCloudButton(
                          text: "Próximo",
                          onPressed: () {
                            Navigate.to(context, const ConfigDesc());
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

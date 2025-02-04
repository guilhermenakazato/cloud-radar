import 'package:cloud_radar/components/filled_cloud_button.dart';
import 'package:cloud_radar/screens/main_screen.dart';
import 'package:cloud_radar/theme/application_colors.dart';
import 'package:cloud_radar/utils/navigate.dart';
import 'package:flutter/material.dart';

class EnjoyScreen extends StatelessWidget {
  const EnjoyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: "image-4",
            child: Image.asset(
              "assets/presentation4.png",
              height: MediaQuery.sizeOf(context).height * 0.5,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
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
                            child: Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Aproveite",
                                  style: TextStyle(
                                    fontFamily: "DM Sans",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ApplicationColors.black900,
                                    color: ApplicationColors.black900,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "4/4",
                                    style: TextStyle(
                                      fontFamily: "DM Sans",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                      color: ApplicationColors.black900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Esse é o fim do nosso Onboarding. Aproveite nosso aplicativo, lembre-se estamos na versão beta.",
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledCloudButton(
                        text: "Próximo",
                        onPressed: () {
                          Navigate.to(context, MainScreen());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_radar/presentation/components/filled_cloud_button.dart';
import 'package:cloud_radar/presentation/components/outlined_cloud_button.dart';
import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:flutter/material.dart';

class ConfigDesc extends StatelessWidget {
  const ConfigDesc({super.key});

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      backgroundColor: ApplicationColors.white50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: OverflowBox(
              maxWidth: double.infinity,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Hero(
                    transitionOnUserGestures: true,
                    tag: "image-3",
                    child: Image.asset(
                      "assets/presentation3-1.png",
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      cacheHeight: (MediaQuery.sizeOf(context).height *
                              0.5 *
                              devicePixelRatio)
                          .toInt(),
                      cacheWidth: (MediaQuery.sizeOf(context).width *
                              0.8 *
                              devicePixelRatio)
                          .toInt(),
                      fit: BoxFit.fill,
                      gaplessPlayback: true,
                    ),
                  ),
                  Hero(
                    transitionOnUserGestures: true,
                    tag: "image-4",
                    child: Image.asset(
                      "assets/presentation4.png",
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      cacheHeight: (MediaQuery.sizeOf(context).height *
                              0.5 *
                              devicePixelRatio)
                          .toInt(),
                      cacheWidth: (MediaQuery.sizeOf(context).width *
                              0.8 *
                              devicePixelRatio)
                          .toInt(),
                      fit: BoxFit.fill,
                      gaplessPlayback: true,
                    ),
                  )
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
                              "Configurações",
                              style: TextStyle(
                                fontFamily: "DM Sans",
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                decorationColor: ApplicationColors.blue400,
                                color: ApplicationColors.blue400,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "3/4",
                                style: TextStyle(
                                  fontFamily: "DM Sans",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: ApplicationColors.blue400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Você possuirá informações essenciais para customizar da forma desejada. As configurações disponíveis são simples, mas potentes!",
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
                    "assets/presentation3-2.png",
                  ),
                  Row(
                    spacing: 2,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedCloudButton(
                          text: "Voltar",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: FilledCloudButton(
                          text: "Próximo",
                          onPressed: () {
                            Navigator.pushNamed(context, "/fourth");
                          },
                        ),
                      ),
                    ],
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

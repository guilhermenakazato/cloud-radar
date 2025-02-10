import 'package:cloud_radar/components/filled_cloud_button.dart';
import 'package:cloud_radar/components/outlined_cloud_button.dart';
import 'package:cloud_radar/screens/enjoy_screen.dart';
import 'package:cloud_radar/screens/first_screen_desc.dart';
import 'package:cloud_radar/theme/application_colors.dart';
import 'package:cloud_radar/theme/cloud_radar_icons.dart';
import 'package:cloud_radar/utils/navigate.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      backgroundColor: ApplicationColors.orange50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: OverflowBox(
              alignment: Alignment.centerLeft,
              maxWidth: double.infinity,
              child: Row(
                children: [
                  Image.asset(
                    "assets/presentation1.png",
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    cacheHeight:
                          (MediaQuery.sizeOf(context).height * 0.5 * devicePixelRatio).toInt(),
                      cacheWidth:
                          (MediaQuery.sizeOf(context).width * 0.8 * devicePixelRatio).toInt(),
                    fit: BoxFit.fill,
                    gaplessPlayback: true,
                  ),
                  Hero(
                    tag: "image-2",
                    child: Image.asset(
                      "assets/presentation2-1.png",
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      cacheHeight:
                          (MediaQuery.sizeOf(context).height * 0.5 * devicePixelRatio).toInt(),
                      cacheWidth:
                          (MediaQuery.sizeOf(context).width * 0.8 * devicePixelRatio).toInt(),
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
                              "Opa!",
                              style: TextStyle(
                                fontFamily: "DM Sans",
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                decorationColor: ApplicationColors.red200,
                                color: ApplicationColors.red200,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "1/4",
                                style: TextStyle(
                                  fontFamily: "DM Sans",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: ApplicationColors.red200,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Bom, aqui é uma etapa rápida. Você entenderá informações básicas e diretas sobre o tempo em sua região, ou a qual você deseja.",
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
                  Row(
                    spacing: 2,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedCloudButton(
                          text: "Pular tutorial",
                          onPressed: () {
                            Navigate.to(context, const EnjoyScreen());
                          },
                          icon: const Icon(
                            CloudRadarIcons.setaDireita,
                            color: ApplicationColors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FilledCloudButton(
                          text: "Iniciar",
                          onPressed: () {
                            Navigate.to(context, const FirstScreenDesc());
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

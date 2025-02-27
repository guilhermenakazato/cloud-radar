import 'package:cloud_radar/logic/cubit/temperature_scale_cubit.dart';
import 'package:cloud_radar/logic/cubit/wind_unit_cubit.dart';
import 'package:cloud_radar/presentation/components/prediction.dart';
import 'package:cloud_radar/presentation/components/search_input.dart';
import 'package:cloud_radar/presentation/screens/search_screen.dart';
import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:cloud_radar/presentation/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/rainbg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ApplicationColors.black900.withValues(
                            alpha: 0.9,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: const Text(
                          "Água Clara - MS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ApplicationColors.white,
                            fontSize: 16,
                            fontFamily: "DM Sans",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: ApplicationColors.black900,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        spacing: 10,
                        children: [
                          const Text(
                            "Segunda 16 de Dezembro",
                            style: TextStyle(
                              fontFamily: "DM Sans",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ApplicationColors.white,
                            ),
                          ),
                          BlocBuilder<TemperatureScaleCubit,
                              TemperatureScaleState>(
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Min.: 22",
                                    style: TextStyle(
                                      color: ApplicationColors.blue100,
                                      fontFamily: "DM Sans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "30°",
                                        style: TextStyle(
                                          color: ApplicationColors.white,
                                          fontFamily: "DM Sans",
                                          fontSize: 80,
                                          fontWeight: FontWeight.w500,
                                          height: 1,
                                        ),
                                      ),
                                      Text(
                                        state.chosenTemperatureScale.name,
                                        style: const TextStyle(
                                          color: ApplicationColors.orange500,
                                          fontFamily: "DM Sans",
                                          fontSize: 40,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text("Máx.: 32",
                                  style: TextStyle(
                                      color: ApplicationColors.orange100,
                                      fontFamily: "DM Sans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                ],
                              );
                            },
                          ),
                          const Icon(CloudRadarIcons.chuva),
                          const Text(
                            "Tempo chuvoso",
                            style: TextStyle(
                              color: ApplicationColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "DM Sans",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: ApplicationColors.black900.withValues(
                            alpha: 0.9,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BlocBuilder<WindUnitCubit, WindUnitState>(
                                builder: (context, state) {
                                  return Row(
                                    spacing: 8,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        CloudRadarIcons.vento,
                                        applyTextScaling: true,
                                        size: 24,
                                      ),
                                      Text(
                                        "2.60 ${state.chosenWindUnit.speedUnit} Norte",
                                        style: const TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: ApplicationColors.white,
                                        ),
                                        textScaler:
                                            const TextScaler.linear(0.8),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const Row(
                                spacing: 8,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CloudRadarIcons.umidade,
                                    size: 24,
                                    applyTextScaling: true,
                                  ),
                                  Text(
                                    "Umidade 73%",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: ApplicationColors.white,
                                    ),
                                    textScaler: TextScaler.linear(0.8),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 8,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    CloudRadarIcons.sensacao,
                                    size: 24,
                                    applyTextScaling: true,
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(text: "Põr do sol "),
                                        TextSpan(
                                          text: "18:38",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: ApplicationColors.white,
                                      ),
                                    ),
                                    textScaler: const TextScaler.linear(0.8),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
                          width: double.infinity,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: BlocBuilder<TemperatureScaleCubit,
                                TemperatureScaleState>(
                              builder: (context, state) {
                                return Row(
                                  spacing: 8,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Prediction(
                                      day: "Hoje",
                                      icon: CloudRadarIcons.chuva,
                                      minTemperature: 22,
                                      maxTemperature: 32,
                                      temperatureScale:
                                          state.chosenTemperatureScale.name,
                                      color: ApplicationColors.blue900,
                                    ),
                                    Prediction(
                                      day: "Amanhã",
                                      icon: CloudRadarIcons.sol,
                                      minTemperature: 29,
                                      maxTemperature: 39,
                                      temperatureScale:
                                          state.chosenTemperatureScale.name,
                                    ),
                                    Prediction(
                                      day: "18/12",
                                      icon: CloudRadarIcons.solComNuvens,
                                      minTemperature: 28,
                                      maxTemperature: 32,
                                      temperatureScale:
                                          state.chosenTemperatureScale.name,
                                    ),
                                    Prediction(
                                      day: "19/12",
                                      icon: CloudRadarIcons.inferno,
                                      minTemperature: 28,
                                      maxTemperature: 30,
                                      temperatureScale:
                                          state.chosenTemperatureScale.name,
                                    ),
                                    Prediction(
                                      day: "20/12",
                                      icon: CloudRadarIcons.solComNuvens,
                                      minTemperature: 27,
                                      maxTemperature: 30,
                                      temperatureScale:
                                          state.chosenTemperatureScale.name,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SearchInput(
                              readonly: true,
                              canRequestFocus: false,
                              onTap: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  enableDrag: false,
                                  builder: (BuildContext modalContext) {
                                    return SearchScreen(appContext: context);
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/config");
                              },
                              icon: const Icon(
                                CloudRadarIcons.configuracao,
                              ),
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
        ),
      ),
    );
  }
}

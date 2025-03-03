import 'package:cloud_radar/data/models/weather.dart';
import 'package:cloud_radar/logic/cubit/forecast_cubit.dart';
import 'package:cloud_radar/logic/cubit/temperature_scale_cubit.dart';
import 'package:cloud_radar/logic/cubit/wind_unit_cubit.dart';
import 'package:cloud_radar/presentation/components/bold_half.dart';
import 'package:cloud_radar/presentation/components/forecast_list.dart';
import 'package:cloud_radar/presentation/components/prediction.dart';
import 'package:cloud_radar/presentation/components/search_input.dart';
import 'package:cloud_radar/presentation/screens/search_screen.dart';
import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:cloud_radar/presentation/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ForecastCubit>().fetchForecast("Brasília,DF");
  }

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
            child: BlocBuilder<ForecastCubit, ForecastState>(
              builder: (context, state) {
                if (state is ForecastLoadInProgress) {
                  return const Center(
                    child: Text(
                      "Loading",
                      style: TextStyle(
                        color: ApplicationColors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "DM Sans",
                      ),
                    ),
                  );
                } else if (state is ForecastLoadSuccess) {
                  Weather weatherPredictionCurrentScreen =
                      state.forecast.weatherPredictions.first;
                  String cityName = weatherPredictionCurrentScreen.city,
                      date =
                          "${weatherPredictionCurrentScreen.weekday} ${weatherPredictionCurrentScreen.writtenDate}",
                      minTemperature = weatherPredictionCurrentScreen
                          .minTemperature
                          .toString(),
                      maxTemperature = weatherPredictionCurrentScreen
                          .maxTemperature
                          .toString(),
                      weatherDescription =
                          weatherPredictionCurrentScreen.weatherDescription,
                      windSpeed =
                          weatherPredictionCurrentScreen.windSpeed.toString(),
                      humidity =
                          weatherPredictionCurrentScreen.humidity.toString(),
                      sunsetTime = weatherPredictionCurrentScreen.sunsetTime;
                  int? currentTemperature =
                      weatherPredictionCurrentScreen.currentTemperature;
                  String? windDirection =
                      weatherPredictionCurrentScreen.windCardinal;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: ApplicationColors.black900,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              child: Text(
                                cityName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
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
                            decoration: BoxDecoration(
                              color: ApplicationColors.black900
                                  .withValues(alpha: 0.9),
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              spacing: 10,
                              children: [
                                Text(
                                  date,
                                  style: const TextStyle(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Min.: $minTemperature°",
                                          style: const TextStyle(
                                            color: ApplicationColors.blue100,
                                            fontFamily: "DM Sans",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        currentTemperature == null
                                            ? const Text("Opsie")
                                            : Row(
                                                children: [
                                                  Text(
                                                    "$currentTemperature°",
                                                    style: const TextStyle(
                                                      color: ApplicationColors
                                                          .white,
                                                      fontFamily: "DM Sans",
                                                      fontSize: 80,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1,
                                                    ),
                                                  ),
                                                  Text(
                                                    state.chosenTemperatureScale
                                                        .name,
                                                    style: const TextStyle(
                                                      color: ApplicationColors
                                                          .orange500,
                                                      fontFamily: "DM Sans",
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        Text(
                                          "Máx.: $maxTemperature°",
                                          style: const TextStyle(
                                            color: ApplicationColors.orange100,
                                            fontFamily: "DM Sans",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                const Icon(CloudRadarIcons.rain),
                                Text(
                                  weatherDescription,
                                  style: const TextStyle(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                color: ApplicationColors.black900,
                                borderRadius: BorderRadius.vertical(
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
                                      builder: (context, windUnitState) {
                                        return Row(
                                          spacing: 8,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              CloudRadarIcons.wind,
                                              applyTextScaling: true,
                                              size: 24,
                                            ),
                                            BoldHalf(
                                              normalText:
                                                  '$windSpeed ${windUnitState.chosenWindUnit.speedUnit}',
                                              boldText: windDirection!,
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
                                    Row(
                                      spacing: 8,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          CloudRadarIcons.humidity,
                                          size: 24,
                                          applyTextScaling: true,
                                        ),
                                        BoldHalf(
                                          normalText: "Umidade",
                                          boldText: "$humidity%",
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
                                    ),
                                    Row(
                                      spacing: 8,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          CloudRadarIcons.sunset,
                                          size: 24,
                                          applyTextScaling: true,
                                        ),
                                        BoldHalf(
                                          normalText: "Pôr do sol",
                                          boldText: sunsetTime,
                                          textScaler:
                                              const TextScaler.linear(0.8),
                                          style: const TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: ApplicationColors.white,
                                          ),
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
                            ForecastList(
                              predictions: state.forecast.weatherPredictions,
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
                                          return SearchScreen(
                                              appContext: context);
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
                                      CloudRadarIcons.setting,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text(
                      "Ops! Erro.",
                      style: TextStyle(
                        color: ApplicationColors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "DM Sans",
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

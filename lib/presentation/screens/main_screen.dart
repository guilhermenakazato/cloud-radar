import 'package:cloud_radar/data/models/current_day_weather.dart';
import 'package:cloud_radar/data/models/weather.dart';
import 'package:cloud_radar/logic/cubit/forecast_cubit.dart';
import 'package:cloud_radar/presentation/components/current_temperature_text.dart';
import 'package:cloud_radar/presentation/components/custom_refresh.dart';
import 'package:cloud_radar/presentation/components/forecast_list.dart';
import 'package:cloud_radar/presentation/components/gradient_line.dart';
import 'package:cloud_radar/presentation/components/search_input.dart';
import 'package:cloud_radar/presentation/components/skeleton_loading.dart';
import 'package:cloud_radar/presentation/components/small_forecast_info.dart';
import 'package:cloud_radar/presentation/screens/search_screen.dart';
import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:cloud_radar/presentation/theme/cloud_radar_icons.dart';
import 'package:cloud_radar/utils/formatter.dart';
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
    final forecastState = context.read<ForecastCubit>().state;

    if (forecastState.weatherStatus.isSuccess) {
      context.read<ForecastCubit>().updateForecast("Aquidauana,MS");
    } else {
      context.read<ForecastCubit>().fetchForecast("Brasília,DF");
    }
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
            child: BlocConsumer<ForecastCubit, ForecastState>(
              listener: (context, state) {
                if (state.weatherStatus.updateFailure) {
                  debugPrint("Erro :(");
                }
              },
              builder: (context, state) {
                if (state.weatherStatus.isLoading) {
                  return const SkeletonLoading();
                } else if (state.weatherStatus.isSuccess ||
                    state.weatherStatus.isUpdating) {
                  int currentForecastIndex = state.selectedForecastIndex;
                  Weather weatherPrediction =
                      state.forecast[currentForecastIndex];
                  String cityName = weatherPrediction.city,
                      date = Formatter.fullDateWithWeekdayAndDate(
                        weatherPrediction.weekday,
                        weatherPrediction.writtenDate,
                      ),
                      sunsetTime = weatherPrediction.sunsetTime,
                      weatherDescription = weatherPrediction.weatherDescription;

                  int minTemperature = weatherPrediction.minTemperature,
                      maxTemperature = weatherPrediction.maxTemperature,
                      humidity = weatherPrediction.humidity;
                  double windSpeed = weatherPrediction.windSpeed;
                  int? currentTemperature =
                      weatherPrediction.currentTemperature;
                  String? windDirection = weatherPrediction.windCardinal;

                  return CustomRefresh(
                    onRefresh: () async {
                      context
                          .read<ForecastCubit>()
                          .updateForecast("Aquidauana,MS");
                    },
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: constraints.maxWidth,
                              minHeight: constraints.maxHeight,
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
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
                                          borderRadius:
                                              const BorderRadius.vertical(
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Min.: $minTemperature°",
                                                  style: const TextStyle(
                                                    color: ApplicationColors
                                                        .blue100,
                                                    fontFamily: "DM Sans",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                weatherPrediction
                                                        is CurrentDayWeather
                                                    ? CurrentTemperatureText(
                                                        currentTemperature:
                                                            currentTemperature!,
                                                        temperatureScale: state
                                                            .chosenTemperatureScale
                                                            .name,
                                                      )
                                                    : const GradientLine(),
                                                Text(
                                                  "Máx.: $maxTemperature°",
                                                  style: const TextStyle(
                                                    color: ApplicationColors
                                                        .orange100,
                                                    fontFamily: "DM Sans",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
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
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                weatherPrediction
                                                        is CurrentDayWeather
                                                    ? SmallForecastInfo(
                                                        normalText:
                                                            '${Formatter.formatFloat(windSpeed)} ${state.chosenWindUnit.speedUnit}',
                                                        boldText:
                                                            windDirection!,
                                                        icon: CloudRadarIcons
                                                            .wind,
                                                      )
                                                    : Container(),
                                                SmallForecastInfo(
                                                  normalText: "Umidade",
                                                  boldText: "$humidity%",
                                                  icon:
                                                      CloudRadarIcons.humidity,
                                                ),
                                                SmallForecastInfo(
                                                  normalText: "Pôr do sol",
                                                  boldText: sunsetTime,
                                                  icon: CloudRadarIcons.sunset,
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
                                      bottom:
                                          MediaQuery.sizeOf(context).height *
                                              0.04,
                                    ),
                                    child: Column(
                                      spacing: 8,
                                      children: [
                                        ForecastList(
                                          predictions: state.forecast,
                                        ),
                                        Row(
                                          spacing: 8,
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
                                                    builder: (BuildContext
                                                        modalContext) {
                                                      return SearchScreen(
                                                        appContext: context,
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, "/config");
                                              },
                                              icon: const Icon(
                                                CloudRadarIcons.setting,
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
                        );
                      },
                    ),
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

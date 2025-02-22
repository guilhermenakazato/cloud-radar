import 'package:cloud_radar/presentation/components/prediction.dart';
import 'package:cloud_radar/presentation/components/search_input.dart';
import 'package:cloud_radar/presentation/screens/search_screen.dart';
import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:cloud_radar/presentation/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FocusNode _inputFocus = FocusNode();
  double _iconOpacity = 0.25;

  @override
  void initState() {
    super.initState();
    _inputFocus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _inputFocus.removeListener(_onFocusChange);
    _inputFocus.dispose();
  }

  void _onFocusChange() {
    double newOpacity = _inputFocus.hasFocus ? 1 : 0.25;

    setState(() {
      _iconOpacity = newOpacity;
    });
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
                      child: const Column(
                        children: [
                          Text(
                            "Segunda 16 de Dezembro",
                            style: TextStyle(
                              fontFamily: "DM Sans",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ApplicationColors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
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
                                "C",
                                style: TextStyle(
                                  color: ApplicationColors.orange500,
                                  fontFamily: "DM Sans",
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Icon(CloudRadarIcons.chuva),
                          Text(
                            "Tempo chuvoso",
                            style: TextStyle(
                              color: ApplicationColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "DM Sans",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 14.0),
                            child: Text(
                              "Chuvinha boa",
                              style: TextStyle(
                                color: ApplicationColors.orange200,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Jaldi",
                              ),
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
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                spacing: 8,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CloudRadarIcons.vento,
                                    applyTextScaling: true,
                                    size: 24,
                                  ),
                                  Text(
                                    "2.60 Km/h Norte",
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
                                  Icon(
                                    CloudRadarIcons.sensacao,
                                    size: 24,
                                    applyTextScaling: true,
                                  ),
                                  Text(
                                    "Sensação de 26°",
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
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            child: SearchInput(
                              iconOpacity: _iconOpacity,
                              inputFocus: _inputFocus,
                              onTap: () {
                                _inputFocus.unfocus();
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

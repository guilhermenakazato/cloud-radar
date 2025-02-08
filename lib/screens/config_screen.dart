import 'package:cloud_radar/components/cloud_appbar.dart';
import 'package:cloud_radar/components/list_item.dart';
import 'package:cloud_radar/enums/temperature_scale.dart';
import 'package:cloud_radar/enums/wind_speed.dart';
import 'package:cloud_radar/screens/subscription_plans_screen.dart';
import 'package:cloud_radar/theme/application_colors.dart';
import 'package:cloud_radar/theme/cloud_radar_icons.dart';
import 'package:cloud_radar/utils/cloud_radar_dialog.dart';
import 'package:cloud_radar/utils/navigate.dart';
import 'package:flutter/material.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  TemperatureScale? _chosenTemperatureScale = TemperatureScale.C;
  WindSpeed? _chosenWindSpeedUnit = WindSpeed.km;
  bool _activateWidget = false, _hasMembership = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.black800,
      appBar: const CloudAppbar(
        titleText: "Configurações",
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            spacing: 20,
            children: [
              Column(
                spacing: 10,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      const Icon(CloudRadarIcons.assinatura),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Seu plano - ",
                            style: TextStyle(
                              color: ApplicationColors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: "DM Sans",
                              fontSize: 16,
                            ),
                          ),
                          !_hasMembership
                              ? const Text(
                                  "Não assinante",
                                  style: TextStyle(
                                    color: ApplicationColors.red400,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "DM Sans",
                                    fontSize: 16,
                                  ),
                                )
                              : const Row(
                                  spacing: 8,
                                  children: [
                                    Text(
                                      "Assinante",
                                      style: TextStyle(
                                        color: ApplicationColors.green500,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "DM Sans",
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(
                                      CloudRadarIcons.guardaChuva,
                                      color: ApplicationColors.green500,
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "Assine qualquer um dos planos e tenha acesso ao Widget para visualizar informações detalhadas em sua tela de desbloqueio.",
                    style: TextStyle(
                      color: ApplicationColors.white,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  ListItem(
                    titleText: "Assine agora",
                    subtitleText: "Veja benefícios",
                    trailing: const Icon(CloudRadarIcons.setaDireita),
                    onTap: () {
                      Navigate.to(context, const SubscriptionPlansScreen());
                    },
                  ),
                ],
              ),
              const Divider(),
              Column(
                spacing: 10,
                children: [
                  const Row(
                    spacing: 10,
                    children: [
                      Icon(CloudRadarIcons.widget),
                      Text(
                        "Opções estilizadas",
                        style: TextStyle(
                          color: ApplicationColors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "DM Sans",
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Ativar widget",
                          style: TextStyle(
                            color: ApplicationColors.white,
                            fontSize: 16,
                            fontFamily: "DM Sans",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Switch(
                          value: _activateWidget,
                          activeColor: ApplicationColors.green500,
                          inactiveThumbColor: ApplicationColors.red600,
                          inactiveTrackColor: ApplicationColors.red100,
                          onChanged: (bool value) {
                            setState(() {
                              _activateWidget = value;
                            });

                            if (_activateWidget && !_hasMembership) {
                              CloudRadarDialog.showDialog(
                                context: context,
                                titleText: "Atenção",
                                contentText:
                                    "Parece que você não é assinante premium.",
                                confirmButtonText: "Assine",
                                declineButtonText: "Agora não",
                                onConfirm: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    _hasMembership = true;
                                  });
                                },
                                onDecline: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    _activateWidget = false;
                                  });
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Ative essa opção para deixar o aplicativo sempre ativo na tela inicial do seu celular. Requer assinatura mensal. Necessário ser assinante.",
                    style: TextStyle(
                      color: ApplicationColors.white,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Column(
                spacing: 10,
                children: [
                  const Row(
                    spacing: 10,
                    children: [
                      Icon(CloudRadarIcons.temperatura),
                      Text(
                        "Temperatura",
                        style: TextStyle(
                          color: ApplicationColors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "DM Sans",
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ListItem(
                        titleText: "Celsius (C)",
                        subtitleText: "Será representado com a letra C",
                        selected: _chosenTemperatureScale == TemperatureScale.C,
                        onTap: () {
                          setState(() {
                            _chosenTemperatureScale = TemperatureScale.C;
                          });
                        },
                        trailing: Radio<TemperatureScale>(
                          value: TemperatureScale.C,
                          groupValue: _chosenTemperatureScale,
                          onChanged: (TemperatureScale? value) {
                            setState(
                              () {
                                _chosenTemperatureScale = value;
                              },
                            );
                          },
                        ),
                      ),
                      ListItem(
                        titleText: "Fahrenheit (F)",
                        subtitleText: "Será representado com a letra F",
                        selected: _chosenTemperatureScale == TemperatureScale.F,
                        onTap: () {
                          setState(() {
                            _chosenTemperatureScale = TemperatureScale.F;
                          });
                        },
                        trailing: Radio<TemperatureScale>(
                          value: TemperatureScale.F,
                          groupValue: _chosenTemperatureScale,
                          onChanged: (TemperatureScale? value) {
                            setState(
                              () {
                                _chosenTemperatureScale = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Column(
                spacing: 10,
                children: [
                  const Row(
                    spacing: 10,
                    children: [
                      Icon(CloudRadarIcons.velocidadeVento),
                      Text(
                        "Velocidade",
                        style: TextStyle(
                          color: ApplicationColors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "DM Sans",
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ListItem(
                        titleText: "Km/h",
                        subtitleText: "Quilômetro por hora",
                        selected: _chosenWindSpeedUnit == WindSpeed.km,
                        onTap: () {
                          setState(() {
                            _chosenWindSpeedUnit = WindSpeed.km;
                          });
                        },
                        trailing: Radio<WindSpeed>(
                          value: WindSpeed.km,
                          groupValue: _chosenWindSpeedUnit,
                          onChanged: (WindSpeed? value) {
                            setState(
                              () {
                                _chosenWindSpeedUnit = value;
                              },
                            );
                          },
                        ),
                      ),
                      ListItem(
                        titleText: "M/s",
                        subtitleText: "Metro por segundo",
                        selected: _chosenWindSpeedUnit == WindSpeed.m,
                        onTap: () {
                          setState(() {
                            _chosenWindSpeedUnit = WindSpeed.m;
                          });
                        },
                        trailing: Radio<WindSpeed>(
                          value: WindSpeed.m,
                          groupValue: _chosenWindSpeedUnit,
                          onChanged: (WindSpeed? value) {
                            setState(
                              () {
                                _chosenWindSpeedUnit = value;
                              },
                            );
                          },
                        ),
                      ),
                      ListItem(
                        titleText: "Mph",
                        subtitleText: "Milha por hora",
                        selected: _chosenWindSpeedUnit == WindSpeed.mph,
                        onTap: () {
                          setState(() {
                            _chosenWindSpeedUnit = WindSpeed.mph;
                          });
                        },
                        trailing: Radio<WindSpeed>(
                          value: WindSpeed.mph,
                          groupValue: _chosenWindSpeedUnit,
                          onChanged: (WindSpeed? value) {
                            setState(
                              () {
                                _chosenWindSpeedUnit = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

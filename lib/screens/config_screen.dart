import 'package:cloud_radar/components/cloud_appbar.dart';
import 'package:cloud_radar/components/config_tile.dart';
import 'package:cloud_radar/enums/temperature_scale.dart';
import 'package:cloud_radar/enums/wind_speed.dart';
import 'package:cloud_radar/theme/application_colors.dart';
import 'package:cloud_radar/theme/cloud_radar_icons.dart';
import 'package:cloud_radar/utils/cloud_radar_dialog.dart';
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
      backgroundColor: ApplicationColors.black,
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
                          ),
                          !_hasMembership
                              ? const Text(
                                  "Não assinante",
                                )
                              : const Row(
                                  spacing: 8,
                                  children: [
                                    Text(
                                      "Assinante",
                                    ),
                                    Icon(
                                      CloudRadarIcons.guardaChuva,
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "Assine qualquer um dos planos e tenha acesso ao Widget para visualizar informações detalhadas em sua tela de desbloqueio.",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          child: TextButton(
                            onPressed: () {},
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Plano anual"),
                                Text("R\$ 27,30"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          child: TextButton(
                            onPressed: () {},
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Plano mensal"),
                                Text("R\$ 2,30"),
                              ],
                            ),
                          ),
                        ),
                      )
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
                      Icon(CloudRadarIcons.widget),
                      Text("Opções estilizadas"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Ativar widget"),
                        Switch(
                          value: _activateWidget,
                          activeColor: ApplicationColors.red400,
                          onChanged: (bool value) {
                            setState(() {
                              _activateWidget = value;
                            });

                            if (_activateWidget && !_hasMembership) {
                              CloudRadarDialog.showDialog(
                                context: context,
                                title: const Center(
                                  child: Text(
                                    "Atenção!",
                                  ),
                                ),
                                content: const Text(
                                  "Parece que você não é assinante premium.",
                                  textAlign: TextAlign.center,
                                ),
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
                      Text("Temperatura")
                    ],
                  ),
                  Column(
                    children: [
                      ConfigTile<TemperatureScale>(
                        groupValue: _chosenTemperatureScale,
                        tileValue: TemperatureScale.C,
                        titleText: 'Celsius (C)',
                        subtitleText: 'Será representado com a letra C',
                        onTileTap: () {
                          setState(() {
                            _chosenTemperatureScale = TemperatureScale.C;
                          });
                        },
                        onRadioTap: (TemperatureScale? value) {
                          setState(() {
                            _chosenTemperatureScale = value;
                          });
                        },
                      ),
                      ConfigTile<TemperatureScale>(
                        groupValue: _chosenTemperatureScale,
                        tileValue: TemperatureScale.F,
                        titleText: 'Celsius (F)',
                        subtitleText: 'Será representado com a letra F',
                        onTileTap: () {
                          setState(() {
                            _chosenTemperatureScale = TemperatureScale.F;
                          });
                        },
                        onRadioTap: (TemperatureScale? value) {
                          setState(() {
                            _chosenTemperatureScale = value;
                          });
                        },
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
                      Text("Velocidade")
                    ],
                  ),
                  Column(
                    children: [
                      ConfigTile<WindSpeed>(
                        groupValue: _chosenWindSpeedUnit,
                        tileValue: WindSpeed.km,
                        onTileTap: () {
                          setState(() {
                            _chosenWindSpeedUnit = WindSpeed.km;
                          });
                        },
                        onRadioTap: (WindSpeed? value) {
                          setState(() {
                            _chosenWindSpeedUnit = value;
                          });
                        },
                        titleText: 'Km/h',
                        subtitleText: 'Quilômetro por hora',
                      ),
                      ConfigTile<WindSpeed>(
                        groupValue: _chosenWindSpeedUnit,
                        tileValue: WindSpeed.m,
                        onTileTap: () {
                          setState(() {
                            _chosenWindSpeedUnit = WindSpeed.m;
                          });
                        },
                        onRadioTap: (WindSpeed? value) {
                          setState(() {
                            _chosenWindSpeedUnit = value;
                          });
                        },
                        titleText: 'M/s',
                        subtitleText: 'Metro por segundo',
                      ),
                      ConfigTile<WindSpeed>(
                        groupValue: _chosenWindSpeedUnit,
                        tileValue: WindSpeed.mph,
                        onTileTap: () {
                          setState(() {
                            _chosenWindSpeedUnit = WindSpeed.mph;
                          });
                        },
                        onRadioTap: (WindSpeed? value) {
                          setState(() {
                            _chosenWindSpeedUnit = value;
                          });
                        },
                        titleText: 'Km/h',
                        subtitleText: 'Milha por hora',
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

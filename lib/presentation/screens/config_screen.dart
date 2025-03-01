import 'package:cloud_radar/logic/cubit/temperature_scale_cubit.dart';
import 'package:cloud_radar/logic/cubit/wind_unit_cubit.dart';
import 'package:cloud_radar/presentation/components/cloud_appbar.dart';
import 'package:cloud_radar/presentation/components/list_item.dart';
import 'package:cloud_radar/logic/enums/temperature_scale.dart';
import 'package:cloud_radar/logic/enums/wind_speed.dart';
import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:cloud_radar/presentation/theme/cloud_radar_icons.dart';
import 'package:cloud_radar/utils/cloud_radar_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  // TODO: sumir com isso usando bloc
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
                      const Icon(CloudRadarIcons.subscribe),
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
                                      CloudRadarIcons.umbrella,
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
                    trailing: const Icon(CloudRadarIcons.arrowright),
                    onTap: () {
                      Navigator.pushNamed(context, "/plans");
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
                      Icon(CloudRadarIcons.style),
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
                                confirmButtonText: "Ver planos",
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
                  RichText(
                    text: const TextSpan(
                      text:
                          "Ative essa opção para deixar o aplicativo sempre ativo na tela inicial do seu celular. Requer assinatura mensal. ",
                      children: <TextSpan>[
                        TextSpan(
                          text: "Necessário ser assinante.",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                      style: TextStyle(
                        color: ApplicationColors.white,
                        fontFamily: "DM Sans",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
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
                      Icon(CloudRadarIcons.temperature),
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
                  BlocBuilder<TemperatureScaleCubit, TemperatureScaleState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          ListItem(
                            titleText: "Celsius (C)",
                            subtitleText: "Será representado com a letra C",
                            selected: state.chosenTemperatureScale ==
                                TemperatureScale.C,
                            onTap: () {
                              context
                                  .read<TemperatureScaleCubit>()
                                  .changeTemperatureScale(TemperatureScale.C);
                            },
                            trailing: Radio<TemperatureScale>(
                              value: TemperatureScale.C,
                              groupValue: state.chosenTemperatureScale,
                              onChanged: (TemperatureScale? value) {
                                context
                                    .read<TemperatureScaleCubit>()
                                    .changeTemperatureScale(value!);
                              },
                            ),
                          ),
                          ListItem(
                            titleText: "Fahrenheit (F)",
                            subtitleText: "Será representado com a letra F",
                            selected: state.chosenTemperatureScale ==
                                TemperatureScale.F,
                            onTap: () {
                              context
                                  .read<TemperatureScaleCubit>()
                                  .changeTemperatureScale(TemperatureScale.F);
                            },
                            trailing: Radio<TemperatureScale>(
                              value: TemperatureScale.F,
                              groupValue: state.chosenTemperatureScale,
                              onChanged: (TemperatureScale? value) {
                                context
                                    .read<TemperatureScaleCubit>()
                                    .changeTemperatureScale(value!);
                              },
                            ),
                          ),
                        ],
                      );
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
                      Icon(CloudRadarIcons.windmeasure),
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
                  BlocBuilder<WindUnitCubit, WindUnitState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          ListItem(
                            titleText: "Km/h",
                            subtitleText: "Quilômetro por hora",
                            selected: state.chosenWindUnit == WindSpeed.km,
                            onTap: () {
                              context
                                  .read<WindUnitCubit>()
                                  .changeWindUnit(WindSpeed.km);
                            },
                            trailing: Radio<WindSpeed>(
                              value: WindSpeed.km,
                              groupValue: state.chosenWindUnit,
                              onChanged: (WindSpeed? value) {
                                context
                                    .read<WindUnitCubit>()
                                    .changeWindUnit(value!);
                              },
                            ),
                          ),
                          ListItem(
                            titleText: "M/s",
                            subtitleText: "Metro por segundo",
                            selected: state.chosenWindUnit == WindSpeed.m,
                            onTap: () {
                              context
                                  .read<WindUnitCubit>()
                                  .changeWindUnit(WindSpeed.m);
                            },
                            trailing: Radio<WindSpeed>(
                              value: WindSpeed.m,
                              groupValue: state.chosenWindUnit,
                              onChanged: (WindSpeed? value) {
                                context
                                    .read<WindUnitCubit>()
                                    .changeWindUnit(value!);
                              },
                            ),
                          ),
                          ListItem(
                            titleText: "Mph",
                            subtitleText: "Milha por hora",
                            selected: state.chosenWindUnit == WindSpeed.mph,
                            onTap: () {
                              context
                                  .read<WindUnitCubit>()
                                  .changeWindUnit(WindSpeed.mph);
                            },
                            trailing: Radio<WindSpeed>(
                              value: WindSpeed.mph,
                              groupValue: state.chosenWindUnit,
                              onChanged: (WindSpeed? value) {
                                context
                                    .read<WindUnitCubit>()
                                    .changeWindUnit(value!);
                              },
                            ),
                          ),
                        ],
                      );
                    },
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

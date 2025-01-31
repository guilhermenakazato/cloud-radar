import 'package:cloud_radar/enums/temperature_scale.dart';
import 'package:cloud_radar/enums/wind_speed.dart';
import 'package:flutter/material.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  TemperatureScale? _chosenTemperatureScale = TemperatureScale.C;
  WindSpeed? _chosenWindSpeedUnit = WindSpeed.km;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/icons/back.png"),
        title: Text("Configurações"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
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
                      Image.asset("assets/icons/money.png"),
                      Text("Seu plano - Não assinante"),
                    ],
                  ),
                  Text(
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
                            child: Column(
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
                            child: Column(
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
              Divider(),
              Column(
                spacing: 10,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Image.asset("assets/icons/widget.png"),
                      Text("Opções estilizadas"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        Text("Ativar widget"),
                      ],
                    ),
                  ),
                  Text(
                    "Ative essa opção para deixar o aplicativo sempre ativo na tela inicial do seu celular. Requer assinatura mensal. Necessário ser assinante.",
                  ),
                ],
              ),
              Divider(),
              Column(
                spacing: 10,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Image.asset("assets/icons/thermometer.png"),
                      Text("Temperatura")
                    ],
                  ),
                  Column(
                    children: [
                      Material(
                        color: Colors.black,
                        child: RadioListTile<TemperatureScale>(
                          contentPadding: EdgeInsets.all(10),
                          value: TemperatureScale.C,
                          selected:
                              _chosenTemperatureScale == TemperatureScale.C,
                          selectedTileColor: Colors.amber,
                          tileColor: Colors.black,
                          title: Text(
                            "Celsius (C)",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            "Será representado com a letra C",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          groupValue: _chosenTemperatureScale,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (TemperatureScale? value) {
                            setState(() {
                              _chosenTemperatureScale = value;
                            });
                          },
                        ),
                      ),
                      Material(
                        child: ListTileTheme(
                          child: RadioListTile<TemperatureScale>(
                            contentPadding: EdgeInsets.all(10),
                            value: TemperatureScale.F,
                            title: Text(
                              "Fahrenheit (F)",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              "Será representado com a letra F",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            tileColor: Colors.black,
                            groupValue: _chosenTemperatureScale,
                            selectedTileColor: Colors.amber,
                            selected:
                                _chosenTemperatureScale == TemperatureScale.F,
                            controlAffinity: ListTileControlAffinity.trailing,
                            onChanged: (TemperatureScale? value) {
                              setState(() {
                                _chosenTemperatureScale = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Column(
                spacing: 10,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Image.asset("assets/icons/wind-speed.png"),
                      Text("Velocidade")
                    ],
                  ),
                  Material(
                    color: Colors.black,
                    child: RadioListTile<WindSpeed>(
                      contentPadding: EdgeInsets.all(10),
                      value: WindSpeed.km,
                      selected: _chosenWindSpeedUnit == WindSpeed.km,
                      selectedTileColor: Colors.amber,
                      tileColor: Colors.black,
                      title: Text(
                        "Km/h",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "Quilômetro por hora",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      groupValue: _chosenWindSpeedUnit,
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (WindSpeed? value) {
                        setState(() {
                          _chosenWindSpeedUnit = value;
                        });
                      },
                    ),
                  ),
                  Material(
                    color: Colors.black,
                    child: RadioListTile<WindSpeed>(
                      contentPadding: EdgeInsets.all(10),
                      value: WindSpeed.m,
                      selected: _chosenWindSpeedUnit == WindSpeed.m,
                      selectedTileColor: Colors.amber,
                      tileColor: Colors.black,
                      title: Text(
                        "M/s",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "Metro por segundo",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      groupValue: _chosenWindSpeedUnit,
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (WindSpeed? value) {
                        setState(() {
                          _chosenWindSpeedUnit = value;
                        });
                      },
                    ),
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

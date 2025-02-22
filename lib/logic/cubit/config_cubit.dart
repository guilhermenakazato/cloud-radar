import 'package:cloud_radar/logic/enums/temperature_scale.dart';
import 'package:cloud_radar/logic/enums/wind_speed.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';

part 'config_state.dart';

class ConfigCubit extends HydratedCubit<ConfigState> {
  ConfigCubit()
      : super(ConfigState(
          chosenTemperatureScale: TemperatureScale.C,
          chosenWindSpeed: WindSpeed.km,
        ));

  void changeTemperatureScale(newTemperatureScale) => emit(state.copyWith(
        chosenTemperatureScale: newTemperatureScale,
      ));

  void changeWindSpeedScale(newWindSpeedScale) =>
      emit(state.copyWith(chosenWindSpeed: newWindSpeedScale));

  @override
  ConfigState? fromJson(Map<String, dynamic> json) {
    return ConfigState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ConfigState state) {
    return state.toMap();
  }
}

import 'package:cloud_radar/logic/enums/temperature_scale.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';

part 'temperature_scale_state.dart';

class TemperatureScaleCubit extends HydratedCubit<TemperatureScaleState> {
  TemperatureScaleCubit()
      : super(
          TemperatureScaleState(
            chosenTemperatureScale: TemperatureScale.C,
          ),
        );

  void changeTemperatureScale(TemperatureScale? newTemperatureScale) => emit(
        state.copyWith(
          chosenTemperatureScale: newTemperatureScale,
        ),
      );

  @override
  TemperatureScaleState? fromJson(Map<String, dynamic> json) {
    return TemperatureScaleState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TemperatureScaleState state) {
    return state.toMap();
  }
}

import 'dart:convert';

import 'package:cloud_radar/data/models/weather.dart';
import 'package:cloud_radar/logic/enums/temperature_scale.dart';
import 'package:cloud_radar/logic/enums/wind_speed.dart';
import 'package:cloud_radar/data/repositories/weather_repository.dart';
import 'package:cloud_radar/utils/conversion.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/foundation.dart';
part 'forecast_state.dart';

class ForecastCubit extends HydratedCubit<ForecastState> {
  ForecastCubit({
    required this.repository,
  }) : super(
          ForecastState(
            selectedForecastIndex: 0,
            forecast: List<Weather>.empty(),
            chosenTemperatureScale: TemperatureScale.C,
            chosenWindUnit: WindSpeed.km,
            weatherStatus: WeatherStatus.initial,
          ),
        );

  final WeatherRepository repository;

  Future<void> fetchForecast(String? city) async {
    if (city == null || city.isEmpty) return;

    emit(
      ForecastState(
        selectedForecastIndex: state.selectedForecastIndex,
        forecast: state.forecast,
        chosenTemperatureScale: state.chosenTemperatureScale,
        chosenWindUnit: state.chosenWindUnit,
        weatherStatus: WeatherStatus.loading,
      ),
    );

    try {
      List<Weather> newForecast = await repository.getFormattedForecastList(
        city,
        state.chosenTemperatureScale,
        state.chosenWindUnit,
      );

      emit(
        ForecastState(
          selectedForecastIndex: state.selectedForecastIndex,
          forecast: newForecast,
          chosenTemperatureScale: state.chosenTemperatureScale,
          chosenWindUnit: state.chosenWindUnit,
          weatherStatus: WeatherStatus.success,
        ),
      );
    } on Exception catch (_) {
      emit(
        ForecastState(
          exception: "Falha ao pegar dados.",
          selectedForecastIndex: state.selectedForecastIndex,
          forecast: state.forecast,
          chosenTemperatureScale: state.chosenTemperatureScale,
          chosenWindUnit: state.chosenWindUnit,
          weatherStatus: WeatherStatus.failure,
        ),
      );
    }
  }

  Future<void> updateForecast(String? city) async {
    if (city == null || city.isEmpty) return;

    emit(
      ForecastState(
        selectedForecastIndex: state.selectedForecastIndex,
        forecast: state.forecast,
        chosenTemperatureScale: state.chosenTemperatureScale,
        chosenWindUnit: state.chosenWindUnit,
        weatherStatus: WeatherStatus.updating,
      ),
    );

    try {
      List<Weather> newForecast = await repository.getFormattedForecastList(
        city,
        state.chosenTemperatureScale,
        state.chosenWindUnit,
      );

      emit(
        ForecastState(
          selectedForecastIndex: state.selectedForecastIndex,
          forecast: newForecast,
          chosenTemperatureScale: state.chosenTemperatureScale,
          chosenWindUnit: state.chosenWindUnit,
          weatherStatus: WeatherStatus.success,
        ),
      );
    } on Exception catch (_) {
      emit(
        ForecastState(
          selectedForecastIndex: state.selectedForecastIndex,
          forecast: state.forecast,
          chosenTemperatureScale: state.chosenTemperatureScale,
          chosenWindUnit: state.chosenWindUnit,
          weatherStatus: WeatherStatus.updateFailure,
          exception: "Falha ao atualizar dados.",
        ),
      );
    }
  }

  void changeSelectedForecast(selectedForecastIndex) => {
        if (state.weatherStatus.isSuccess)
          {
            emit(
              state.copyWith(
                selectedForecastIndex: selectedForecastIndex,
              ),
            )
          }
        else
          {
            emit(
              ForecastState(
                selectedForecastIndex: state.selectedForecastIndex,
                forecast: state.forecast,
                chosenTemperatureScale: state.chosenTemperatureScale,
                chosenWindUnit: state.chosenWindUnit,
                weatherStatus: WeatherStatus.updateFailure,
                exception: "Tente novamente mais tarde.",
              ),
            )
          }
      };

  void changeTemperatureScale(TemperatureScale newTemperatureScale) {
    List<Weather> changedScaleWeather = List<Weather>.from(
      state.forecast.map((weather) {
        if (weather.currentTemperature != null) {
          weather.currentTemperature = Conversion.changeTemperatureScale(
            newTemperatureScale,
            weather.currentTemperature!,
          );
        }

        weather.minTemperature = Conversion.changeTemperatureScale(
          newTemperatureScale,
          weather.minTemperature,
        );
        weather.maxTemperature = Conversion.changeTemperatureScale(
          newTemperatureScale,
          weather.maxTemperature,
        );

        return weather;
      }),
    );

    emit(
      state.copyWith(
        chosenTemperatureScale: newTemperatureScale,
        forecast: changedScaleWeather,
      ),
    );
  }

  void changeWindUnit(WindSpeed newWindUnit) {
    List<Weather> changedWindUnitWeather = List<Weather>.from(
      state.forecast.map(
        (weather) {
          weather.windSpeed = Conversion.changeWindSpeedUnit(
            state.chosenWindUnit,
            newWindUnit,
            weather.windSpeed,
          );

          return weather;
        },
      ),
    );

    emit(state.copyWith(
        chosenWindUnit: newWindUnit, forecast: changedWindUnitWeather));
  }

  @override
  ForecastState? fromJson(Map<String, dynamic> json) {
    return ForecastState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ForecastState state) {
    return state.toJson();
  }
}

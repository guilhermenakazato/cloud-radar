import 'package:cloud_radar/data/models/forecast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_radar/data/repositories/weather_repository.dart';
part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  ForecastCubit({
    required this.repository,
  }) : super(
          ForecastInitial(
            0,
            Forecast.empty(),
          ),
        );

  final WeatherRepository repository;

  Future<void> fetchForecast(String? city) async {
    if (city == null || city.isEmpty) return;

    emit(ForecastLoadInProgress(0, state.forecast));

    try {
      Forecast forecast = await repository.getFormattedForecastList(city);
      emit(ForecastLoadSuccess(0, forecast));
    } on Exception catch (exception) {
      emit(ForecastLoadFailure(exception: exception, 0, state.forecast));
    }
  }

  Future<void> updateForecast(String? city) async {
    if (city == null || city.isEmpty) return;
    final int currentIndex = state.selectedForecastIndex;

    emit(ForecastUpdateInProgress(currentIndex, state.forecast));

    try {
      Forecast forecast = await repository.getFormattedForecastList(city);
      emit(ForecastLoadSuccess(currentIndex, forecast));
    } on Exception catch (exception) {
      emit(ForecastUpdateFailure(currentIndex, state.forecast,
          exception: exception));
    }
  }

  void changeSelectedForecast(selectedForecastIndex) => {
        if (state is ForecastLoadSuccess)
          {emit(state.copyWith(selectedForecastIndex: selectedForecastIndex))}
        else
          {
            emit(
              ForecastUpdateFailure(0, state.forecast, exception: Exception()),
            )
          }
      };
}

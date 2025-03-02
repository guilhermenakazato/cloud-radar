import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_radar/data/models/forecast.dart';
import 'package:cloud_radar/data/repositories/weather_repository.dart';
part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  ForecastCubit({
    required this.repository,
  }) : super(const ForecastInitial());

  final WeatherRepository repository;

  Future<void> fetchForecast(String? city) async {
    if (city == null || city.isEmpty) return;

    emit(const ForecastLoadInProgress());

    try {
      Forecast forecast = await repository.getFormattedForecastList(city);
      emit(ForecastLoadSuccess(forecast: forecast));
      debugPrint("Done!");
    } on Exception catch (exception) {
      emit(ForecastLoadFailure(exception: exception));
    }
  }
}

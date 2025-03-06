import 'dart:convert';

import 'package:cloud_radar/data/providers/weather_provider.dart';
import 'package:cloud_radar/logic/enums/temperature_scale.dart';
import 'package:cloud_radar/logic/enums/wind_speed.dart';
import 'package:http/http.dart';
import '../models/weather.dart';

class WeatherRepository {
  final _weatherProvider = WeatherProvider();

  Future<List<Weather>> getFormattedForecastList(
    String city,
    TemperatureScale currentTemperatureScale,
    WindSpeed currentWindUnit,
  ) async {
    final Response predictionsApiResponse =
        await _weatherProvider.getPredictions(city);

    if (predictionsApiResponse.statusCode != 200) {
      throw Exception(predictionsApiResponse.body);
    }

    final String rawPredictions = predictionsApiResponse.body;
    final wholePrediction = json.decode(rawPredictions);
    Iterable forecastIterable = wholePrediction['forecast'];

    int iterableIndex = 0;
    List<Weather> weatherPredictions = List<Weather>.from(
      forecastIterable.map(
        (unformattedWeatherPrediction) {
          final weatherPrediction = Weather.fromApiJson(
            unformattedWeatherPrediction,
            city,
            iterableIndex,
            wholePrediction,
            currentTemperatureScale,
            currentWindUnit,
          );

          iterableIndex++;
          return weatherPrediction;
        },
      ),
    );

    return weatherPredictions;
  }
}

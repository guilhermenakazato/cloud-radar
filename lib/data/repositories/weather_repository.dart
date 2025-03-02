import 'dart:convert';

import 'package:cloud_radar/data/models/forecast.dart';
import 'package:cloud_radar/data/providers/weather_provider.dart';
import 'package:http/http.dart';
import '../models/weather.dart';

class WeatherRepository {
  final _weatherProvider = WeatherProvider();

  Future<Forecast> getFormattedForecastList(String city) async {
    final Response predictionsApiResponse =
        await _weatherProvider.getPredictions(city);

    if (predictionsApiResponse.statusCode != 200) {
      throw Exception(predictionsApiResponse.body);
    }

    final String rawPredictions = predictionsApiResponse.body;
    final wholePrediction = json.decode(rawPredictions);
    Iterable forecastIterable = wholePrediction['forecast'];
    final int currentDayTemperature = wholePrediction['temp'];

    int iterableIndex = 0;
    List<Weather> weatherPredictions = List<Weather>.from(
      forecastIterable.map(
        (unformattedWeatherPrediction) {
          final weatherPrediction = Weather.forecastFromJson(
            unformattedWeatherPrediction,
            city,
            iterableIndex,
            currentDayTemperature,
          );

          iterableIndex++;
          return weatherPrediction;
        },
      ),
    );

    final forecast = Forecast(
      weatherPredictions: weatherPredictions,
    );

    return forecast;
  }
}

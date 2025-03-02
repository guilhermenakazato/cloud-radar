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
    Iterable forecastIterable = json.decode(rawPredictions)['forecast'];

    List<Weather> weatherPredictions = List<Weather>.from(
      forecastIterable.map(
        (unformattedWeatherPrediction) {
          return Weather.forecastFromJson(unformattedWeatherPrediction, city);
        },
      ),
    );

    final weatherNow = Weather.currentDayFromJson(
        json.decode(rawPredictions) as Map<String, dynamic>,
        weatherPredictions.first);

    final forecast = Forecast(
      forecast: weatherPredictions,
      weatherNow: weatherNow,
    );

    return forecast;
  }
}

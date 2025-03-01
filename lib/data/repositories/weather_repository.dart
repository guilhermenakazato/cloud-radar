import 'dart:convert';

import 'package:cloud_radar/data/models/forecast.dart';
import 'package:cloud_radar/data/providers/weather_provider.dart';
import 'package:http/http.dart';
import '../models/weather.dart';

class WeatherRepository {
  final _weatherProvider = WeatherProvider();

  Future<Forecast> getFormattedForecastList() async {
    final Response predictionsApiResponse =
        await _weatherProvider.getPredictions();

    if (predictionsApiResponse.statusCode != 200) {
      throw Exception(predictionsApiResponse.body);
    }

    final String rawPredictions = predictionsApiResponse.body;
    var forecastJson = jsonDecode(rawPredictions)['forecast'];
    final List<String> unformattedWeatherPredictions = List.from(forecastJson);
    final List<Weather> formattedWeatherPredictions =
        unformattedWeatherPredictions
            .map<Weather>((element) => Weather.fromJson(element))
            .toList();

    final forecast = Forecast(forecast: formattedWeatherPredictions);
    return forecast;
  }
}

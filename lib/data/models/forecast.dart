import 'package:cloud_radar/data/models/weather.dart';

class Forecast {
  List<Weather> weatherPredictions;

  Forecast({
    required this.weatherPredictions,
  });

  @override
  String toString() {
    String returnString = "";

    for (Weather weather in weatherPredictions) {
      returnString += "$weather\n";
    }

    return returnString;
  }

  factory Forecast.empty() {
    return Forecast(weatherPredictions: List<Weather>.empty());
  }
}

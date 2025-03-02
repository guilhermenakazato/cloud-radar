import 'package:cloud_radar/data/models/weather.dart';

class Forecast {
  List<Weather> forecast;
  Weather weatherNow;

  Forecast({
    required this.forecast,
    required this.weatherNow,
  });

  @override
  String toString() {
    String returnString = "";

    for (Weather weather in forecast) {
      returnString += "$weather\n";
    }

    returnString += weatherNow.toString();
    return returnString;
  }
}

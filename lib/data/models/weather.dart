import 'package:cloud_radar/data/models/current_day_weather.dart';
import 'package:cloud_radar/data/models/other_day_weather.dart';
import 'package:cloud_radar/utils/formatter.dart';

abstract class Weather {
  String city;
  String weekday;
  String numberDate;
  String writtenDate;
  String weatherDescription;
  String sunsetTime;
  String? windCardinal;
  int minTemperature;
  int maxTemperature;
  int? currentTemperature;
  double windSpeed;
  int humidity;
  DateTime lastUpdated;

  Weather({
    required this.city,
    required this.weekday,
    required this.numberDate,
    required this.writtenDate,
    required this.weatherDescription,
    required this.sunsetTime,
    required this.minTemperature,
    required this.maxTemperature,
    this.currentTemperature,
    required this.windSpeed,
    required this.humidity,
    required this.lastUpdated,
    required this.windCardinal,
  });

  factory Weather.forecastFromJson(
    Map<String, dynamic> jsonMap,
    String cityName,
    int weatherPredictionOrder,
    Map<String, dynamic> wholePredictionJsonMap,
  ) {
    final numberDate = jsonMap['date'];

    switch (weatherPredictionOrder) {
      case 0:
        return CurrentDayWeather(
          city: Formatter.formatStringNameToCloudFormat(cityName),
          weekday: Formatter.getWeekdayWithAbbreviation(jsonMap['weekday']),
          numberDate: "Hoje",
          writtenDate: Formatter.numberDateToWrittenDate(numberDate),
          weatherDescription: wholePredictionJsonMap['description'],
          sunsetTime:
              Formatter.getMilitaryTimeFromStandardTime(jsonMap['sunset']),
          windCardinal: wholePredictionJsonMap['wind_cardinal'],
          minTemperature: jsonMap['min'],
          maxTemperature: jsonMap['max'],
          currentTemperature: wholePredictionJsonMap['temp'],
          windSpeed: Formatter.windSpeedTextToValue(wholePredictionJsonMap['wind_speedy']),
          humidity: wholePredictionJsonMap['humidity'],
          lastUpdated: DateTime.now(),
        );
      case 1:
        return OtherDayWeather(
          city: Formatter.formatStringNameToCloudFormat(cityName),
          weekday: Formatter.getWeekdayWithAbbreviation(jsonMap['weekday']),
          numberDate: "Amanhã",
          writtenDate: Formatter.numberDateToWrittenDate(jsonMap['date']),
          weatherDescription: jsonMap['description'],
          sunsetTime:
              Formatter.getMilitaryTimeFromStandardTime(jsonMap['sunset']),
          windCardinal: null,
          minTemperature: jsonMap['min'],
          maxTemperature: jsonMap['max'],
          currentTemperature: null,
          windSpeed: Formatter.windSpeedTextToValue(jsonMap['wind_speedy']),
          humidity: jsonMap['humidity'],
          lastUpdated: DateTime.now(),
        );
      default:
        return OtherDayWeather(
          city: Formatter.formatStringNameToCloudFormat(cityName),
          weekday: Formatter.getWeekdayWithAbbreviation(jsonMap['weekday']),
          numberDate: numberDate,
          writtenDate: Formatter.numberDateToWrittenDate(jsonMap['date']),
          weatherDescription: jsonMap['description'],
          sunsetTime:
              Formatter.getMilitaryTimeFromStandardTime(jsonMap['sunset']),
          windCardinal: null,
          minTemperature: jsonMap['min'],
          maxTemperature: jsonMap['max'],
          currentTemperature: null,
          windSpeed: Formatter.windSpeedTextToValue(jsonMap['wind_speedy']),
          humidity: jsonMap['humidity'],
          lastUpdated: DateTime.now(),
        );
    }
  }

  @override
  String toString() {
    return 'Weather(city: $city, weekday: $weekday, numberDate: $numberDate, writtenDate: $writtenDate, weatherDescription: $weatherDescription, sunsetTime: $sunsetTime, minTemperature: $minTemperature, maxTemperature: $maxTemperature, currentTemperature: $currentTemperature, windSpeed: $windSpeed, windCardinal: $windCardinal, humidity: $humidity, lastUpdated: $lastUpdated)';
  }
}

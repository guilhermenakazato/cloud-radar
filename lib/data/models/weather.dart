import 'package:cloud_radar/utils/formatter.dart';

class Weather {
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
    int currentDayTemperature,
    String currentDayWindDirection,
  ) {
    final numberDate = jsonMap['date'];
    late String predictionComponentDate;
    int? currentTemperature;
    String? windDirection;

    switch (weatherPredictionOrder) {
      case 0:
        windDirection = currentDayWindDirection;
        currentTemperature = currentDayTemperature;
        predictionComponentDate = "Hoje";
        break;
      case 1:
        currentTemperature = null;
        predictionComponentDate = "Amanhã";
      default:
        predictionComponentDate = numberDate;
    }

    return Weather(
      city: Formatter.formatStringNameToCloudFormat(cityName),
      weekday: Formatter.getWeekdayWithAbbreviation(jsonMap['weekday']),
      numberDate: predictionComponentDate,
      writtenDate: Formatter.numberDateToWrittenDate(numberDate),
      weatherDescription: jsonMap['description'],
      sunsetTime: Formatter.getMilitaryTimeFromStandardTime(jsonMap['sunset']),
      windCardinal: windDirection,
      minTemperature: jsonMap['min'],
      maxTemperature: jsonMap['max'],
      currentTemperature: currentTemperature,
      windSpeed: Formatter.windSpeedTextToValue(jsonMap['wind_speedy']),
      humidity: jsonMap['humidity'],
      lastUpdated: DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'Weather(city: $city, weekday: $weekday, numberDate: $numberDate, writtenDate: $writtenDate, weatherDescription: $weatherDescription, sunsetTime: $sunsetTime, minTemperature: $minTemperature, maxTemperature: $maxTemperature, currentTemperature: $currentTemperature, windSpeed: $windSpeed, windCardinal: $windCardinal, humidity: $humidity, lastUpdated: $lastUpdated)';
  }
}

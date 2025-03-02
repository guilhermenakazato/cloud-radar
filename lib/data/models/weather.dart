import 'dart:convert';
import 'package:cloud_radar/utils/formatted_date.dart';

class Weather {
  String city;
  String weekday;
  String numberDate;
  String writtenDate;
  String weatherDescription;
  String sunsetTime;
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
  });

  String toJson() => json.encode({
        'city': city,
        'weekday': weekday,
        'numberDate': numberDate,
        'writtenDate': writtenDate,
        'weatherDescription': weatherDescription,
        'sunsetTime': sunsetTime,
        'minTemperature': minTemperature,
        'maxTemperature': maxTemperature,
        'currentTemperature': currentTemperature,
        'windSpeed': windSpeed,
        'humidity': humidity,
        'lastUpdated': lastUpdated.millisecondsSinceEpoch,
      });

  factory Weather.forecastFromJson(
    Map<String, dynamic> jsonMap,
    String cityName,
    int weatherPredictionOrder,
    int currentDayTemperature,
  ) {
    final String formattedCityName = cityName.replaceFirst(",", " - ");

    final numberDate = jsonMap['date'];
    late String predictionComponentDate;
    final windSpeedComplete = jsonMap['wind_speedy'];
    final double windSpeedValue =
        double.parse(windSpeedComplete.toString().split(" ").first);
    int? currentTemperature;

    switch (weatherPredictionOrder) {
      case 0:
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
      city: formattedCityName,
      weekday: FormattedDate.getWeekdayWithAbbreviation(jsonMap['weekday']),
      numberDate: predictionComponentDate,
      writtenDate: FormattedDate.numberDateToWrittenDate(numberDate),
      weatherDescription: jsonMap['description'],
      sunsetTime:
          FormattedDate.getMilitaryTimeFromStandardTime(jsonMap['sunset']),
      minTemperature: jsonMap['min'],
      maxTemperature: jsonMap['max'],
      currentTemperature: currentTemperature,
      windSpeed: windSpeedValue,
      humidity: jsonMap['humidity'],
      lastUpdated: DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'Weather(city: $city, weekday: $weekday, numberDate: $numberDate, writtenDate: $writtenDate, weatherDescription: $weatherDescription, sunsetTime: $sunsetTime, minTemperature: $minTemperature, maxTemperature: $maxTemperature, currentTemperature: $currentTemperature, windSpeed: $windSpeed, humidity: $humidity, lastUpdated: $lastUpdated)';
  }
}

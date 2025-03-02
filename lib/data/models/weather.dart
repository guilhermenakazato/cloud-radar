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

  factory Weather.currentDayFromJson(
      Map<String, dynamic> jsonMap, Weather forecastForToday) {
    final city = jsonMap['city'].toString().replaceFirst(",", " -");
    final windSpeedComplete = jsonMap['wind_speedy'];
    final double windSpeedValue =
        double.parse(windSpeedComplete.toString().split(" ").first);
    final numberDate = jsonMap['date'];

    return Weather(
      city: city,
      weekday: FormattedDate.getWeekdayWithDate(numberDate),
      numberDate: numberDate,
      writtenDate: FormattedDate.numberDateToWrittenDate(numberDate),
      weatherDescription: jsonMap['description'],
      sunsetTime:
          FormattedDate.getMilitaryTimeFromStandardTime(jsonMap['sunset']),
      minTemperature: forecastForToday.minTemperature,
      maxTemperature: forecastForToday.maxTemperature,
      currentTemperature: jsonMap['temp'],
      windSpeed: windSpeedValue,
      humidity: jsonMap['humidity'],
      lastUpdated: DateTime.now(),
    );
  }

  factory Weather.forecastFromJson(
    Map<String, dynamic> jsonMap,
    String cityName,
  ) {
    final numberDate = jsonMap['date'];
    final windSpeedComplete = jsonMap['wind_speedy'];
    final double windSpeedValue =
        double.parse(windSpeedComplete.toString().split(" ").first);

    return Weather(
      city: cityName,
      weekday: FormattedDate.getWeekdayWithAbbreviation(jsonMap['weekday']),
      numberDate: numberDate,
      writtenDate: FormattedDate.numberDateToWrittenDate(numberDate),
      weatherDescription: jsonMap['description'],
      sunsetTime: jsonMap['sunset'],
      minTemperature: jsonMap['min'],
      maxTemperature: jsonMap['max'],
      currentTemperature: null,
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

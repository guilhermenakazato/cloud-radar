import 'package:cloud_radar/data/models/current_day_weather.dart';
import 'package:cloud_radar/data/models/other_day_weather.dart';
import 'package:cloud_radar/logic/enums/temperature_scale.dart';
import 'package:cloud_radar/logic/enums/wind_speed.dart';
import 'package:cloud_radar/utils/conversion.dart';
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

  factory Weather.fromApiJson(
    Map<String, dynamic> jsonMap,
    String cityName,
    int weatherPredictionOrder,
    Map<String, dynamic> wholePredictionJsonMap,
    TemperatureScale currentTemperatureScale,
    WindSpeed currentWindUnit,
  ) {
    final numberDate = jsonMap['date'];
    double windSpeed =
        Formatter.windSpeedTextToValue(wholePredictionJsonMap['wind_speedy']);
    int minTemperature = jsonMap['min'], maxTemperature = jsonMap['max'];

    if (currentTemperatureScale != TemperatureScale.C) {
      minTemperature = Conversion.changeTemperatureScale(
        TemperatureScale.F,
        minTemperature,
      );
      maxTemperature = Conversion.changeTemperatureScale(
        TemperatureScale.F,
        maxTemperature,
      );
    }

    if (currentWindUnit != WindSpeed.km) {
      windSpeed = Conversion.changeWindSpeedUnit(
        WindSpeed.km,
        currentWindUnit,
        windSpeed,
      );
    }

    switch (weatherPredictionOrder) {
      case 0:
        int currentTemperature = wholePredictionJsonMap['temp'];

        if (currentTemperatureScale != TemperatureScale.C) {
          currentTemperature = Conversion.changeTemperatureScale(
              TemperatureScale.F, currentTemperature,);
        }

        return CurrentDayWeather(
          city: Formatter.formatStringNameToCloudFormat(cityName),
          weekday: Formatter.getWeekdayWithAbbreviation(jsonMap['weekday']),
          numberDate: "Hoje",
          writtenDate: Formatter.numberDateToWrittenDate(numberDate),
          weatherDescription: wholePredictionJsonMap['description'],
          sunsetTime:
              Formatter.getMilitaryTimeFromStandardTime(jsonMap['sunset']),
          windCardinal: wholePredictionJsonMap['wind_cardinal'],
          minTemperature: minTemperature,
          maxTemperature: maxTemperature,
          currentTemperature: currentTemperature,
          windSpeed: windSpeed,
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
          minTemperature: minTemperature,
          maxTemperature: maxTemperature,
          currentTemperature: null,
          windSpeed: windSpeed,
          humidity: jsonMap['humidity'],
          lastUpdated: DateTime.now(),
        );
      default:
        return OtherDayWeather(
          city: Formatter.formatStringNameToCloudFormat(cityName),
          weekday: Formatter.getWeekdayWithAbbreviation(jsonMap['weekday']),
          numberDate: numberDate,
          writtenDate: Formatter.numberDateToWrittenDate(numberDate),
          weatherDescription: jsonMap['description'],
          sunsetTime:
              Formatter.getMilitaryTimeFromStandardTime(jsonMap['sunset']),
          windCardinal: null,
          minTemperature: minTemperature,
          maxTemperature: maxTemperature,
          currentTemperature: null,
          windSpeed: windSpeed,
          humidity: jsonMap['humidity'],
          lastUpdated: DateTime.now(),
        );
    }
  }

  factory Weather.fromBlocJson(Map<String, dynamic> json) {
    if (json['currentTemperature'] != null) {
      return CurrentDayWeather.fromJson(json);
    }

    return OtherDayWeather.fromJson(json);
  }

  Map<String, dynamic> toBlocJson() {
    return {
      'city': city,
      'weekday': weekday,
      'numberDate': numberDate,
      'writtenDate': writtenDate,
      'weatherDescription': weatherDescription,
      'sunsetTime': sunsetTime,
      'windCardinal': windCardinal,
      'minTemperature': minTemperature,
      'maxTemperature': maxTemperature,
      'currentTemperature': currentTemperature,
      'windSpeed': windSpeed,
      'humidity': humidity,
      'lastUpdate': lastUpdated.millisecondsSinceEpoch,
    };
  }

  @override
  String toString() {
    return 'Weather(city: $city, weekday: $weekday, numberDate: $numberDate, writtenDate: $writtenDate, weatherDescription: $weatherDescription, sunsetTime: $sunsetTime, minTemperature: $minTemperature, maxTemperature: $maxTemperature, currentTemperature: $currentTemperature, windSpeed: $windSpeed, windCardinal: $windCardinal, humidity: $humidity, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.city == city &&
        other.weekday == weekday &&
        other.numberDate == numberDate &&
        other.writtenDate == writtenDate &&
        other.weatherDescription == weatherDescription &&
        other.sunsetTime == sunsetTime &&
        other.windCardinal == windCardinal &&
        other.minTemperature == minTemperature &&
        other.maxTemperature == maxTemperature &&
        other.currentTemperature == currentTemperature &&
        other.windSpeed == windSpeed &&
        other.humidity == humidity &&
        other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode {
    return city.hashCode ^
        weekday.hashCode ^
        numberDate.hashCode ^
        writtenDate.hashCode ^
        weatherDescription.hashCode ^
        sunsetTime.hashCode ^
        windCardinal.hashCode ^
        minTemperature.hashCode ^
        maxTemperature.hashCode ^
        currentTemperature.hashCode ^
        windSpeed.hashCode ^
        humidity.hashCode ^
        lastUpdated.hashCode;
  }
}

import 'package:cloud_radar/data/models/weather.dart';

class CurrentDayWeather extends Weather {
  CurrentDayWeather({
    required super.city,
    required super.weekday,
    required super.numberDate,
    required super.writtenDate,
    required super.weatherDescription,
    required super.sunsetTime,
    required super.minTemperature,
    required super.maxTemperature,
    required super.currentTemperature,
    required super.windSpeed,
    required super.humidity,
    required super.lastUpdated,
    required super.windCardinal,
  });
}

import 'package:cloud_radar/data/models/weather.dart';

class OtherDayWeather extends Weather {
  OtherDayWeather({
    required super.city,
    required super.weekday,
    required super.numberDate,
    required super.writtenDate,
    required super.weatherDescription,
    required super.sunsetTime,
    required super.minTemperature,
    required super.maxTemperature,
    required super.windSpeed,
    required super.humidity,
    required super.lastUpdated,
    required super.windCardinal,
    required super.currentTemperature,
  });

  factory OtherDayWeather.fromJson(Map<String, dynamic> json) {
    return OtherDayWeather(
      city: json['city'],
      weekday: json['weekday'],
      numberDate: json['numberDate'],
      writtenDate: json['writtenDate'],
      weatherDescription: json['weatherDescription'],
      sunsetTime: json['sunsetTime'],
      windCardinal: json['windCardinal'],
      minTemperature: json['minTemperature'],
      maxTemperature: json['maxTemperature'],
      currentTemperature: json['currentTemperature'],
      windSpeed: json['windSpeed'] as double,
      humidity: json['humidity'],
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(json['lastUpdate']),
    );
  }

  Map<String, dynamic> toJson() {
    return super.toBlocJson();
  }
}

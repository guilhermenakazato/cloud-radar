// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Weather {
  String city;
  String weekday;
  String date;
  String weatherDescription;
  String sunsetTime;
  int minTemperature;
  int maxTemperature;
  int? currentTemperature;
  double windSpeed;
  double humidity;
  DateTime lastUpdated;

  Weather({
    required this.city,
    required this.weekday,
    required this.date,
    required this.weatherDescription,
    required this.sunsetTime,
    required this.minTemperature,
    required this.maxTemperature,
    this.currentTemperature,
    required this.windSpeed,
    required this.humidity,
    required this.lastUpdated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'weekday': weekday,
      'date': date,
      'weatherDescription': weatherDescription,
      'sunsetTime': sunsetTime,
      'minTemperature': minTemperature,
      'maxTemperature': maxTemperature,
      'currentTemperature': currentTemperature,
      'windSpeed': windSpeed,
      'humidity': humidity,
      'lastUpdated': lastUpdated.millisecondsSinceEpoch,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      city: map['city'],
      weekday: map['weekday'],
      date: map['date'],
      weatherDescription: map['weatherDescription'],
      sunsetTime: map['sunsetTime'],
      minTemperature: map['minTemperature'],
      maxTemperature: map['maxTemperature'],
      currentTemperature: map['currentTemperature'],
      windSpeed: map['windSpeed'],
      humidity: map['humidity'],
      lastUpdated:
          DateTime.fromMillisecondsSinceEpoch(map['lastUpdated'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.city == city &&
        other.weekday == weekday &&
        other.date == date &&
        other.weatherDescription == weatherDescription &&
        other.sunsetTime == sunsetTime &&
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
        date.hashCode ^
        weatherDescription.hashCode ^
        sunsetTime.hashCode ^
        minTemperature.hashCode ^
        maxTemperature.hashCode ^
        currentTemperature.hashCode ^
        windSpeed.hashCode ^
        humidity.hashCode ^
        lastUpdated.hashCode;
  }

  @override
  String toString() {
    return 'Weather(city: $city, weekday: $weekday, date: $date, weatherDescription: $weatherDescription, sunsetTime: $sunsetTime, minTemperature: $minTemperature, maxTemperature: $maxTemperature, currentTemperature: $currentTemperature, windSpeed: $windSpeed, humidity: $humidity, lastUpdated: $lastUpdated)';
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:cloud_radar/data/models/weather.dart';

class Forecast {
  List<Weather> forecast;

  Forecast({
    required this.forecast,
  });

  Forecast copyWith({
    List<Weather>? forecast,
  }) {
    return Forecast(
      forecast: forecast ?? this.forecast,
    );
  }

  @override
  String toString() {
    String returnString = "";

    for (Weather weatherPrediction in forecast) {
      returnString += "$weatherPrediction\n";
    }

    return returnString;
  }

  @override
  bool operator ==(covariant Forecast other) {
    if (identical(this, other)) return true;

    return listEquals(other.forecast, forecast);
  }

  @override
  int get hashCode => forecast.hashCode;
}

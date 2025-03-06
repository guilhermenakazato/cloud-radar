import 'package:cloud_radar/logic/enums/temperature_scale.dart';
import 'package:cloud_radar/logic/enums/wind_speed.dart';

class Conversion {
  Conversion._();

  static int changeTemperatureScale(
    TemperatureScale temperatureUnitChangeTo,
    int temperatureValue,
  ) {
    if (temperatureUnitChangeTo == TemperatureScale.F) {
      return _celsiusToFahrenheit(temperatureValue);
    }

    return _fahrenheitToCelsius(temperatureValue);
  }

  static double changeWindSpeedUnit(
    WindSpeed windSpeedUnitBefore,
    WindSpeed windSpeedUnitChangeTo,
    double windSpeedValue,
  ) {
    switch (windSpeedUnitBefore) {
      case WindSpeed.km:
        return _handleKilometerChange(windSpeedUnitChangeTo, windSpeedValue);
      case WindSpeed.m:
        return _handleMeterChange(windSpeedUnitChangeTo, windSpeedValue);
      case WindSpeed.mph:
        return _handleMileChange(windSpeedUnitChangeTo, windSpeedValue);
    }
  }

  static double _handleKilometerChange(
    WindSpeed windSpeedUnitChangeTo,
    double windSpeedValue,
  ) {
    switch (windSpeedUnitChangeTo) {
      case WindSpeed.km:
        return windSpeedValue;
      case WindSpeed.m:
        return _kilometersPerHourToMetersPerSecond(windSpeedValue);
      case WindSpeed.mph:
        return _kilometersPerHourToMilesPerHour(windSpeedValue);
    }
  }

  static double _handleMeterChange(
    WindSpeed windSpeedUnitChangeTo,
    double windSpeedValue,
  ) {
    switch (windSpeedUnitChangeTo) {
      case WindSpeed.km:
        return _metersPerSecondToKilometersPerHour(windSpeedValue);
      case WindSpeed.m:
        return windSpeedValue;
      case WindSpeed.mph:
        return _metersPerSecondToMilesPerHour(windSpeedValue);
    }
  }

  static double _handleMileChange(
    WindSpeed windSpeedUnitChangeTo,
    double windSpeedValue,
  ) {
    switch (windSpeedUnitChangeTo) {
      case WindSpeed.km:
        return _milesPerHourToKilometersPerHour(windSpeedValue);
      case WindSpeed.m:
        return _milesPerHourToMetersPerSecond(windSpeedValue);
      case WindSpeed.mph:
        return windSpeedValue;
    }
  }

  static int _celsiusToFahrenheit(int temperatureValue) {
    return (temperatureValue * (9 / 5) + 32).round();
  }

  static int _fahrenheitToCelsius(int temperatureValue) {
    return ((temperatureValue - 32) / (9 / 5)).round();
  }

  static double _kilometersPerHourToMilesPerHour(double windSpeedValue) {
    return windSpeedValue / 1.609;
  }

  static double _kilometersPerHourToMetersPerSecond(double windSpeedValue) {
    return windSpeedValue / 3.6;
  }

  static double _milesPerHourToKilometersPerHour(double windSpeedValue) {
    return windSpeedValue * 1.609;
  }

  static double _milesPerHourToMetersPerSecond(double windSpeedValue) {
    return windSpeedValue / 2.237;
  }

  static double _metersPerSecondToKilometersPerHour(double windSpeedValue) {
    return windSpeedValue * 3.6;
  }

  static double _metersPerSecondToMilesPerHour(double windSpeedValue) {
    return windSpeedValue * 2.237;
  }
}

part of 'forecast_cubit.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  failure,
  updating,
  updateFailure
}

extension WeatherStatusCheck on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
  bool get isUpdating => this == WeatherStatus.updating;
  bool get updateFailure => this == WeatherStatus.updateFailure;
}

final class ForecastState {
  const ForecastState({
    required this.selectedForecastIndex,
    required this.forecast,
    required this.chosenTemperatureScale,
    required this.chosenWindUnit,
    required this.weatherStatus,
    this.exception,
  });

  final int selectedForecastIndex;
  final List<Weather> forecast;
  final TemperatureScale chosenTemperatureScale;
  final WindSpeed chosenWindUnit;
  final WeatherStatus weatherStatus;
  final String? exception;

  ForecastState copyWith({
    List<Weather>? forecast,
    int? selectedForecastIndex,
    TemperatureScale? chosenTemperatureScale,
    WindSpeed? chosenWindUnit,
    WeatherStatus? weatherStatus,
  }) {
    return ForecastState(
      selectedForecastIndex:
          selectedForecastIndex ?? this.selectedForecastIndex,
      forecast: forecast ?? this.forecast,
      chosenTemperatureScale:
          chosenTemperatureScale ?? this.chosenTemperatureScale,
      chosenWindUnit: chosenWindUnit ?? this.chosenWindUnit,
      weatherStatus: weatherStatus ?? this.weatherStatus,
    );
  }

  factory ForecastState.fromJson(Map<String, dynamic> json) {
    Iterable rawForecastJsonList = jsonDecode(json['forecast']);

    List<Weather> forecast = List<Weather>.from(
      rawForecastJsonList.map((weatherJson) {
        return Weather.fromBlocJson(weatherJson);
      }),
    );

    final forecastState = ForecastState(
      selectedForecastIndex: json['selectedForecastIndex'],
      forecast: forecast,
      chosenTemperatureScale:
          TemperatureScale.values.byName(json['chosenTemperatureScale']),
      chosenWindUnit: WindSpeed.values.byName(json['chosenWindUnit']),
      weatherStatus: WeatherStatus.values.byName(json['weatherStatus']),
    );

    return forecastState;
  }

  Map<String, dynamic> toJson() {
    return {
      'selectedForecastIndex': selectedForecastIndex,
      'forecast': jsonEncode(forecast),
      'chosenTemperatureScale': chosenTemperatureScale.name,
      'chosenWindUnit': chosenWindUnit.name,
      'weatherStatus': weatherStatus.name,
    };
  }

  @override
  bool operator ==(covariant ForecastState other) {
    if (identical(this, other)) return true;

    return other.selectedForecastIndex == selectedForecastIndex &&
        listEquals(other.forecast, forecast) &&
        other.chosenTemperatureScale == chosenTemperatureScale &&
        other.chosenWindUnit == chosenWindUnit &&
        other.weatherStatus == weatherStatus &&
        other.exception == exception;
  }

  @override
  int get hashCode {
    return selectedForecastIndex.hashCode ^
        forecast.hashCode ^
        chosenTemperatureScale.hashCode ^
        chosenWindUnit.hashCode ^
        weatherStatus.hashCode ^
        exception.hashCode;
  }

  @override
  String toString() {
    return 'ForecastState(selectedForecastIndex: $selectedForecastIndex, forecast: $forecast, chosenTemperatureScale: $chosenTemperatureScale, chosenWindUnit: $chosenWindUnit, weatherStatus: $weatherStatus, exception: $exception)';
  }
}

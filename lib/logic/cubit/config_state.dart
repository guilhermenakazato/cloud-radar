part of 'config_cubit.dart';

class ConfigState {
  WindSpeed? chosenWindSpeed;
  TemperatureScale? chosenTemperatureScale;

  ConfigState({
    this.chosenTemperatureScale,
    this.chosenWindSpeed,
  });

  ConfigState copyWith({
    WindSpeed? chosenWindSpeed,
    TemperatureScale? chosenTemperatureScale,
  }) {
    return ConfigState(
      chosenWindSpeed: chosenWindSpeed ?? this.chosenWindSpeed,
      chosenTemperatureScale:
          chosenTemperatureScale ?? this.chosenTemperatureScale,
    );
  }

  @override
  bool operator ==(covariant ConfigState other) {
    if (identical(this, other)) return true;

    return other.chosenWindSpeed == chosenWindSpeed &&
        other.chosenTemperatureScale == chosenTemperatureScale;
  }

  @override
  int get hashCode =>
      chosenWindSpeed.hashCode ^ chosenTemperatureScale.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chosenWindSpeed': chosenWindSpeed ?? WindSpeed.km,
      'chosenTemperatureScale': chosenTemperatureScale ?? TemperatureScale.C,
    };
  }

  factory ConfigState.fromMap(Map<String, dynamic> map) {
    return ConfigState(
        chosenTemperatureScale: map['chosenTemperatureScale'],
        chosenWindSpeed: map['chosenWindSpeed']);
  }

  String toJson() => json.encode(toMap());

  factory ConfigState.fromJson(String source) =>
      ConfigState.fromMap(json.decode(source));
}

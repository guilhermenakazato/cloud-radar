part of 'temperature_scale_cubit.dart';

class TemperatureScaleState {
  TemperatureScale chosenTemperatureScale;

  TemperatureScaleState({
    required this.chosenTemperatureScale,
  });

  TemperatureScaleState copyWith({
    TemperatureScale? chosenTemperatureScale,
  }) {
    return TemperatureScaleState(
      chosenTemperatureScale:
          chosenTemperatureScale ?? this.chosenTemperatureScale,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chosenTemperatureScale': chosenTemperatureScale.name,
    };
  }

  factory TemperatureScaleState.fromMap(Map<String, dynamic> map) {
    return TemperatureScaleState(
        chosenTemperatureScale: TemperatureScale.values.byName(map['chosenTemperatureScale']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TemperatureScaleState.fromJson(String source) =>
      TemperatureScaleState.fromMap(json.decode(source));

  @override
  bool operator ==(covariant TemperatureScaleState other) {
    if (identical(this, other)) return true;
  
    return 
      other.chosenTemperatureScale == chosenTemperatureScale;
  }

  @override
  int get hashCode => chosenTemperatureScale.hashCode;
}

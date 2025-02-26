part of 'wind_unit_cubit.dart';

class WindUnitState {
  WindSpeed chosenWindUnit;

  WindUnitState({
    required this.chosenWindUnit,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chosenWindUnit': chosenWindUnit.name,
    };
  }

  factory WindUnitState.fromMap(Map<String, dynamic> map) {
    return WindUnitState(
      chosenWindUnit: WindSpeed.values.byName(map['chosenWindUnit'])
    );
  }

  String toJson() => json.encode(toMap());

  factory WindUnitState.fromJson(String source) => WindUnitState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant WindUnitState other) {
    if (identical(this, other)) return true;
  
    return 
      other.chosenWindUnit == chosenWindUnit;
  }

  @override
  int get hashCode => chosenWindUnit.hashCode;

  WindUnitState copyWith({
    WindSpeed? chosenWindUnit,
  }) {
    return WindUnitState(
      chosenWindUnit: chosenWindUnit ?? this.chosenWindUnit,
    );
  }
}

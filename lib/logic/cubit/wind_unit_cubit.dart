import 'package:cloud_radar/logic/enums/wind_speed.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';

part 'wind_unit_state.dart';

class WindUnitCubit extends HydratedCubit<WindUnitState> {
  WindUnitCubit() : super(WindUnitState(chosenWindUnit: WindSpeed.km));

  void changeWindUnit(WindSpeed? newWindUnit) => emit(
        state.copyWith(
          chosenWindUnit: newWindUnit,
        ),
      );

  @override
  WindUnitState? fromJson(Map<String, dynamic> json) {
    return WindUnitState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(WindUnitState state) {
    return state.toMap();
  }
}

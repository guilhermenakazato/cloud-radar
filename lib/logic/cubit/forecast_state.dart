part of 'forecast_cubit.dart';

@immutable
sealed class ForecastState {
  const ForecastState(this.selectedForecastIndex, this.forecast);
  final int selectedForecastIndex;
  final Forecast forecast;

  ForecastState copyWith({
    Forecast? forecast,
    int? selectedForecastIndex,
  });
}

final class ForecastInitial extends ForecastState {
  const ForecastInitial(super.selectedForecastIndex, super.forecast);

  @override
  ForecastInitial copyWith({Forecast? forecast, int? selectedForecastIndex}) =>
      this;
}

final class ForecastLoadInProgress extends ForecastState {
  const ForecastLoadInProgress(super.selectedForecastIndex, super.forecast);

  @override
  ForecastLoadInProgress copyWith(
          {Forecast? forecast, int? selectedForecastIndex}) =>
      this;
}

final class ForecastLoadSuccess extends ForecastState {
  const ForecastLoadSuccess(super.selectedForecastIndex,
      super.forecast);

  @override
  ForecastLoadSuccess copyWith({
    Forecast? forecast,
    int? selectedForecastIndex,
  }) {
    return ForecastLoadSuccess(
      selectedForecastIndex ?? this.selectedForecastIndex,
      forecast ?? this.forecast,
    );
  }
}

final class ForecastLoadFailure extends ForecastState {
  const ForecastLoadFailure(super.selectedForecastIndex, super.forecast,
      {required this.exception});
  final Exception exception;

  @override
  ForecastLoadFailure copyWith(
          {Forecast? forecast, int? selectedForecastIndex}) =>
      this;
}

final class ForecastUpdateInProgress extends ForecastState {
  const ForecastUpdateInProgress(super.selectedForecastIndex, super.forecast);

  @override
  ForecastUpdateInProgress copyWith(
          {Forecast? forecast, int? selectedForecastIndex}) =>
      this;
}

final class ForecastUpdateFailure extends ForecastState {
  const ForecastUpdateFailure(super.selectedForecastIndex, super.forecast,
      {required this.exception});
  final Exception exception;

  @override
  ForecastUpdateFailure copyWith(
          {Forecast? forecast, int? selectedForecastIndex}) =>
      this;
}

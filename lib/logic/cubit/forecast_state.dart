part of 'forecast_cubit.dart';

@immutable
sealed class ForecastState {
  const ForecastState(this.selectedForecastIndex);
  final int selectedForecastIndex;

  ForecastState copyWith({
    Forecast? forecast,
    int? selectedForecastIndex,
  });
}

final class ForecastInitial extends ForecastState {
  const ForecastInitial(super.selectedForecastIndex);

  @override
  ForecastInitial copyWith({Forecast? forecast, int? selectedForecastIndex}) =>
      this;
}

final class ForecastLoadInProgress extends ForecastState {
  const ForecastLoadInProgress(super.selectedForecastIndex);

  @override
  ForecastLoadInProgress copyWith(
          {Forecast? forecast, int? selectedForecastIndex}) =>
      this;
}

final class ForecastLoadSuccess extends ForecastState {
  const ForecastLoadSuccess(super.selectedForecastIndex, {required this.forecast});
  final Forecast forecast;

  @override
  ForecastLoadSuccess copyWith({
    Forecast? forecast,
    int? selectedForecastIndex,
  }) {
    return ForecastLoadSuccess(
      selectedForecastIndex ?? this.selectedForecastIndex,
      forecast: forecast ?? this.forecast,
    );
  }
}

final class ForecastLoadFailure extends ForecastState {
  const ForecastLoadFailure(super.selectedForecastIndex,
      {required this.exception});
  final Exception exception;

  @override
  ForecastLoadFailure copyWith(
          {Forecast? forecast, int? selectedForecastIndex}) =>
      this;
}

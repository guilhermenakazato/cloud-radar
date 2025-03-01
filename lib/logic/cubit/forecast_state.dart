part of 'forecast_cubit.dart';

class ForecastState {
  const ForecastState();
}

final class ForecastInitial extends ForecastState {
  const ForecastInitial();
}

final class ForecastLoadInProgress extends ForecastState {
  const ForecastLoadInProgress();
}

final class ForecastLoadSuccess extends ForecastState {
  const ForecastLoadSuccess({required this.forecast});
  final Forecast forecast;
}

final class ForecastLoadFailure extends ForecastState {
  const ForecastLoadFailure({required this.exception});
  final Exception exception;
}

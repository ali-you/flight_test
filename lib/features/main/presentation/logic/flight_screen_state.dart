part of 'flight_screen_cubit.dart';

@immutable
sealed class FlightScreenState extends Equatable {}

final class FlightScreenInitial extends FlightScreenState {
  @override
  List<Object?> get props => [];
}

final class SuccessFlightState extends FlightScreenState {
  final List<FlightModel> flightList;

  SuccessFlightState(this.flightList);

  @override
  List<Object?> get props => [flightList];
}

final class LoadingFlightState extends FlightScreenState {
  @override
  List<Object?> get props => [];
}

final class ErrorFlightState extends FlightScreenState {
  @override
  List<Object?> get props => [];
}

final class ChangeDateState extends FlightScreenState {
  final DateTime datetime;

  ChangeDateState(this.datetime);

  @override
  List<Object?> get props => [datetime];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:golrang_task/features/main/data/models/flight_model.dart';
import 'package:golrang_task/features/main/domain/usecases/flight_list_usecase.dart';
import 'package:meta/meta.dart';

part 'flight_screen_state.dart';

class FlightScreenCubit extends Cubit<FlightScreenState> {
  FlightScreenCubit(this.flightListUsecase) : super(FlightScreenInitial()){
    getFlightList();
  }

  final FlightListUsecase flightListUsecase;

  Future<void> getFlightList() async {
    emit(LoadingFlightState());
    List<FlightModel>? res = await flightListUsecase.call();
    res == null ? emit(ErrorFlightState()) : emit(SuccessFlightState(res));
  }

  Future<void> changeDate(DateTime datetime) async {
    emit(ChangeDateState(datetime));
  }
}

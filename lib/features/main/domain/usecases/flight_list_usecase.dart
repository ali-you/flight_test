import 'package:golrang_task/features/main/domain/repositories/flight_repository_interface.dart';

import '../../data/models/flight_model.dart';

class FlightListUsecase {
  FlightListUsecase(this.flightRepositoryInterface);

  final FlightRepositoryInterface flightRepositoryInterface;

  Future<List<FlightModel>?> call() async {
    return await flightRepositoryInterface.getFlightList();
  }
}

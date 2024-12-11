import 'package:golrang_task/features/main/data/models/flight_model.dart';

abstract class FlightRepositoryInterface {
  Future<List<FlightModel>?> getFlightList();
}

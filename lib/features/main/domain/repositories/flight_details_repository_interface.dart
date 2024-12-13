import 'package:golrang_task/features/main/data/models/flight_details_model.dart';

abstract class FlightDetailsRepositoryInterface {
  Future<FlightDetailsModel?> getDetails();
}

import 'package:golrang_task/features/main/data/models/flight_details_model.dart';
import 'package:golrang_task/features/main/domain/repositories/flight_details_repository_interface.dart';

class FlightDetailsUsecase {
  FlightDetailsUsecase(this.flightDetailsRepositoryInterface);

  final FlightDetailsRepositoryInterface flightDetailsRepositoryInterface;

  Future<FlightDetailsModel?> call() async {
    return await flightDetailsRepositoryInterface.getDetails();
  }
}

import 'dart:convert';

import 'package:golrang_task/core/network/response.dart';
import 'package:golrang_task/core/network/rest_service.dart';
import 'package:golrang_task/features/main/data/models/flight_model.dart';
import 'package:golrang_task/features/main/domain/repositories/flight_repository_interface.dart';

class FlightRepository implements FlightRepositoryInterface {
  FlightRepository(this.restService);

  final RestService restService;

  @override
  Future<List<FlightModel>?> getFlightList() async {
    Response response = await restService.get(
        url: "https://my.api.mockaroo.com/api/v1/flights.json?key=b8e48c60");

    List<FlightModel> flightList = [];
    if (response.isSucceed) {
      flightList = List<FlightModel>.from(
          json.decode(response.data!).map((x) => FlightModel.fromJson(x)));
    }

    return flightList;
  }
}

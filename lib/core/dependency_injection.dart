import 'package:get_it/get_it.dart';
import 'package:golrang_task/core/network/http_adapter.dart';
import 'package:golrang_task/core/network/rest_service.dart';
import 'package:golrang_task/features/main/domain/repositories/flight_repository_interface.dart';
import 'package:golrang_task/features/main/domain/usecases/flight_list_usecase.dart';

import '../features/main/data/repositories/flight_repository.dart';

class DependencyInjection {
  final getIt = GetIt.instance;

  void setup() {
    getIt.registerLazySingleton<RestService>(() => RestService(HttpAdapter()));

    getIt.registerSingleton<FlightRepositoryInterface>(
        FlightRepository(getIt<RestService>()));

    getIt.registerFactory<FlightListUsecase>(
        () => FlightListUsecase(getIt<FlightRepositoryInterface>()));
  }
}

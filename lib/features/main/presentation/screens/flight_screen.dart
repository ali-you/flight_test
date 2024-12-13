import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:golrang_task/features/main/data/models/flight_model.dart';
import 'package:golrang_task/features/main/domain/usecases/flight_list_usecase.dart';
import 'package:golrang_task/features/main/presentation/logic/flight_screen_cubit.dart';
import 'package:golrang_task/features/main/presentation/screens/flight_details_screen.dart';
import 'package:golrang_task/features/main/presentation/widgets/date_picker_list.dart';
import 'package:golrang_task/features/main/presentation/widgets/flight_widget.dart';

class FlightScreen extends StatefulWidget {
  const FlightScreen({super.key});

  static String routePath = "/flight";

  BlocProvider provide() => BlocProvider<FlightScreenCubit>(
        create: (context) => FlightScreenCubit(GetIt.I<FlightListUsecase>()),
        child: this,
      );

  @override
  State<FlightScreen> createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  List<FlightModel> _flightList = [];
  List<FlightModel> _sortedList = [];
  Map<DateTime, int>? _minPriceMap;
  bool _loading = true;

  Map<DateTime, int>? _calculateMin(List<FlightModel>? flights){
    if (flights == null || flights.isEmpty) return null;

    Map<DateTime, int> res = {};

    for (var flight in flights) {
      if (flight.startTime != null && flight.price != null) {
        DateTime date = DateTime(
          flight.startTime!.year,
          flight.startTime!.month,
          flight.startTime!.day,
        );
        if (!res.containsKey(date) || flight.price! < res[date]!) {
          res[date] = flight.price!;
        }
      }
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("مشهد   به   تهران"),
        centerTitle: true,
        backgroundColor: const Color(0xff34B1FD),
      ),
      body: BlocBuilder<FlightScreenCubit, FlightScreenState>(
        builder: (context, state) {
          if (state is LoadingFlightState) _loading = true;
          if (state is SuccessFlightState) {
            _loading = false;
            _flightList = state.flightList;
            _sortedList = _flightList;
            _minPriceMap = _calculateMin(_flightList);
          }

          if (state is ChangeDateState) {
            _sortedList = _flightList.where((element) => element.startTime!.day == state.datetime.day).toList();
          }

          if (state is ErrorFlightState) {
            _loading = false;
            return Center(
              child: Column(
                children: [
                  const Text("مشکلی پیش آمده است٬ دوباره تلاش کنید."),
                  OutlinedButton(
                      onPressed: () {
                        context.read<FlightScreenCubit>().getFlightList();
                      },
                      child: const Text("تلاش دوباره"))
                ],
              ),
            );
          }

          return Column(
            children: [
              DatePickerList(
                minPrice: _minPriceMap,
                onTap: (date) {
                  context.read<FlightScreenCubit>().changeDate(date);
                }
              ),
              Expanded(
                child: RefreshIndicator.adaptive(
                  onRefresh: () async {
                    await context.read<FlightScreenCubit>().getFlightList();
                  },
                  child: ListView.builder(
                    itemCount: _loading ? 10 : _sortedList.length,
                    itemBuilder: (context, index) => FlightWidget(
                      flightModel: _loading ? null : _sortedList[index],
                      onTap: () {
                        context.push(FlightDetailsScreen.routePath,
                            extra: _sortedList[index]);
                      },
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

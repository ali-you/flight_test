import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golrang_task/features/main/data/models/flight_model.dart';
import 'package:golrang_task/features/main/presentation/screens/flight_details_screen.dart';
import 'package:golrang_task/features/main/presentation/screens/flight_screen.dart';

class AppRouter {
  AppRouter._();

  static final AppRouter _instance = AppRouter._();

  static AppRouter get instance => _instance;

  final GoRouter router = GoRouter(
    initialLocation: FlightScreen.routePath,
    routes: <RouteBase>[
      GoRoute(
        path: FlightScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child: const FlightScreen().provide());
        },
      ),
      GoRoute(
        path: FlightDetailsScreen.routePath,
        builder: (BuildContext context, GoRouterState state) {
          if (state.extra is! FlightModel) {
            throw ("Flight model not provided.");
          }

          FlightModel flight = state.extra as FlightModel;

          return Directionality(
              textDirection: TextDirection.rtl,
              child: FlightDetailsScreen(flightModel: flight));
        },
      ),
    ],
  );
}

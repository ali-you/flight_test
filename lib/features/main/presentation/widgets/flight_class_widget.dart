import 'package:flutter/material.dart';
import 'package:golrang_task/features/main/data/enums/flight_classes.dart';

class FlightClassWidget extends StatelessWidget {
  const FlightClassWidget({super.key, required this.flightClasses});

  final FlightClasses? flightClasses;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
          color: flightClasses == FlightClasses.economy
              ? const Color(0x226366F1)
              : const Color(0x22F97316),
          shape: const StadiumBorder()),
      child: Text(
        flightClasses?.name ?? "        ",
        style: TextStyle(
          fontSize: 12,
            color: flightClasses == FlightClasses.economy
                ? const Color(0xFF6366F1)
                : const Color(0xFFF97316)),
      ),
    );
  }
}

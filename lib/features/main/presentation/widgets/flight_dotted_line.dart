import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class FlightDottedLine extends StatelessWidget {
  const FlightDottedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: Color(0xff34D1FD),
            size: 8,
          ),
          Expanded(child: DottedLine(dashColor: Color(0xffCFCFD2))),
          Icon(Icons.flight, color: Color(0xff34D1FD), size: 20,),
          Expanded(child: DottedLine(dashColor: Color(0xffCFCFD2))),
          Icon(
            Icons.circle,
            color: Color(0xff34D1FD),
            size: 8,
          ),
        ],
      ),
    );
  }
}

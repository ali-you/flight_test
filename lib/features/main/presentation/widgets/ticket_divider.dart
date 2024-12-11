import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:golrang_task/features/main/presentation/widgets/half_circle.dart';

class TicketDivider extends StatelessWidget {
  const TicketDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomPaint(
            painter: HalfCircle(Theme.of(context).scaffoldBackgroundColor),
            size: const Size(20, 20)),
        const Expanded(child: DottedLine(dashColor: Color(0xffCFCFD2))),
        CustomPaint(
            painter: HalfCircle(Theme.of(context).scaffoldBackgroundColor, TextDirection.rtl),
            size: const Size(20, 20)),
      ],
    );
  }
}

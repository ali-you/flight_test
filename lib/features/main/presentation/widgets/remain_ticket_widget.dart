import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RemainTicketWidget extends StatelessWidget {
  const RemainTicketWidget({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
          color: count <= 5
              ? const Color(0x22EF4444)
              : const Color(0xFFE6E6E7),
          shape: const StadiumBorder()),
      child: Text(
        "${NumberFormat("", "fa").format(count)} بلیت مانده ",
        style: TextStyle(
            fontSize: 10,
            color: count <= 5
                ? const Color(0xFFEF4444)
                : const Color(0xFF84848C)),
      ),
    );
  }
}

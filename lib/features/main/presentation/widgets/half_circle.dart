import 'dart:math';

import 'package:flutter/material.dart';

class HalfCircle extends CustomPainter {
  final Color color;
  final TextDirection direction;

  HalfCircle(this.color, [this.direction = TextDirection.ltr]);


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(direction == TextDirection.ltr ? size.height : 0 , size.width / 2),
        height: size.height,
        width: size.width,
      ),
      direction == TextDirection.ltr ? pi / 2 : -pi / 2,
      pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

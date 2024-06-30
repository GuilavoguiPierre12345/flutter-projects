import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CircularPainter extends CustomPainter {
  final Color backgroundColor;
  final Color lineColor;
  final double width;

  CircularPainter(
      {required this.backgroundColor,
      required this.lineColor,
      required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    //   TODO : implement paint
    Paint backgroundLine = Paint()
        ..color = backgroundColor
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = width;

    Paint completeLine = Paint()
        ..color = backgroundColor
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = width;

    Offset cen = Offset(size.width/2, size.height/2);
    double radius = min(size.width.w/5 , size.height.h/5);

     double sweepAngle = 2*pi;
    canvas.drawCircle(cen, radius, backgroundLine);
    canvas.drawArc(Rect.fromCircle(center: cen, radius: radius), -pi / 2, sweepAngle, false, completeLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

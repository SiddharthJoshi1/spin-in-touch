import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PieSlicePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // draw circle
    Paint defaultPaint = Paint();
    defaultPaint.strokeCap = StrokeCap.round;

    Rect rect = Rect.fromCenter(
        center: size.center(Offset.zero),
        height: size.height,
        width: size.width);
    _drawPieSections(canvas, rect, 10, defaultPaint);
    print("repainted");
  }

  void _drawPieSections(
      Canvas canvas, Rect rect, int numberOfSections, Paint paint) {
    var difference = (2 * pi) / numberOfSections;
    double startAngle = 0;
    for (var index = 0; index < numberOfSections; index++) {
      paint.color =
          Color((index * 0.1 * 0xFFFFFF).toInt()).withOpacity(1.0);
      if (index != 0) {
        startAngle = difference * index;
      }
      print("For index $index the angles are start: $startAngle and end: ${startAngle + difference} ");
      canvas.drawArc(rect, startAngle, difference, true, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

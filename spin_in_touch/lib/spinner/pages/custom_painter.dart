import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PieSlicePainter extends CustomPainter {
  int restartedCount = 0;
  @override
  void paint(Canvas canvas, Size size) {
    // draw circle
    Paint defaultPaint = Paint();
    defaultPaint.strokeCap = StrokeCap.round;

    Rect rect = Rect.fromCenter(
        center: size.center(Offset.zero),
        height: size.height,
        width: size.width);
    _drawPieSections(canvas, rect, 11, defaultPaint);
    print("repainted");
  }

  void _drawPieSections(
      Canvas canvas, Rect rect, int numberOfSections, Paint paint) {
    var difference = (2 * pi) / numberOfSections;
    double startAngle = (3*pi)/2;
    for (var index = 0; index < numberOfSections; index++) {
      paint.color = Color((index * 0.1 * 0xFFFFFF).toInt()).withOpacity(1.0);
      if (index != 0) {
        startAngle = difference * index + (3 * pi) / 2;
      }
      canvas.drawArc(rect, startAngle, difference, true, paint);
      TextSpan span = TextSpan(
        text:  '${index}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white, backgroundColor: Colors.black)
      );
      TextPainter painter = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      );
      painter.layout();
      painter.paint(
          canvas,
          getOffset(rect.width / 2, rect.height / 2, (rect.width / 2) - 40,
              startAngle + difference/2  ));
    }
  }

  Offset getOffset(double cx, double cy, double radius, double angle) {
    double x = cx + radius * cos(angle);
    double y = cy + radius * sin(angle);

    return Offset(x, y);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

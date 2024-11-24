import 'dart:math';
import 'package:flutter/material.dart';

class PieSlicePainter extends CustomPainter {
  final int numberOfSections;
  int restartedCount = 0;

  PieSlicePainter({super.repaint, required this.numberOfSections});
  @override
  void paint(Canvas canvas, Size size) {
    // draw circle
    Paint defaultPaint = Paint();
    defaultPaint.strokeCap = StrokeCap.round;

    Rect rect = Rect.fromCenter(
        center: size.center(Offset.zero),
        height: size.height,
        width: size.width);
    _drawPieSections(canvas, rect, numberOfSections, defaultPaint);
    print("repainted");
  }

  void _drawPieText(int index, Canvas canvas, Rect rect, double startAngle,
      double difference) {
    TextSpan span = TextSpan(
        text: '$index',
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            backgroundColor: Colors.black));
    TextPainter painter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
    );
    painter.layout();
    painter.paint(
        canvas,
        getOffset(rect.width / 2, rect.height / 2, (rect.width / 2) - 40,
            startAngle + (difference / 2)));
  }


  void _drawPieSections(
      Canvas canvas, Rect rect, int numberOfSections, Paint paint) {
    var difference = (2 * pi) / numberOfSections;
    double startAngle = (3 * pi) / 2;
    for (var index = 0; index < numberOfSections; index++) {
      paint.color =
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
      if (index != 0) {
        startAngle = difference * index + (3 * pi) / 2;
      }
      canvas.drawArc(rect, startAngle, difference, true, paint);
      _drawPieText(index, canvas, rect, startAngle, difference);
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

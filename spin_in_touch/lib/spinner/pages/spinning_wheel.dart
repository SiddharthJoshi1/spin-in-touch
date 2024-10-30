import 'dart:math';

import 'package:flutter/material.dart';
import 'custom_painter.dart';

class SpinningWheel extends StatefulWidget {
  const SpinningWheel({super.key});

  @override
  State<SpinningWheel> createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel> {
  double angleForSpin = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Center(
              child: Transform.rotate(
                  angle: angleForSpin,
                  child: RepaintBoundary(
                      child: CustomPaint(
                    size: const Size(700, 700),
                    painter: PieSlicePainter(),
                    // ),
                  )))),
          TextButton(
              onPressed: () {
                spinWheel();
              },
              child: const Text("Press to Spin"))
        ]));
  }

  void spinWheel() {
    setState(() {
      angleForSpin = 90;
    });
  }
}

class SpinningWheelPage extends StatelessWidget {
  const SpinningWheelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinningWheel();
  }
}

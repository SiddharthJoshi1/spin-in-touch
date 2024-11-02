import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'custom_painter.dart';

class SpinningWheel extends StatefulWidget {
  const SpinningWheel({super.key});

  @override
  State<SpinningWheel> createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel>
    with TickerProviderStateMixin {
  double angleForSpin = 0;
  double speed = 0.1;
  bool isSpinning = false;
  Ticker? _ticker;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
              child: Icon(
            Icons.arrow_drop_down_circle_sharp,
            color: Colors.red,
          )),
          SizedBox(height: 10),
          Transform.rotate(
              angle: angleForSpin,
              child: RepaintBoundary(
                  child: CustomPaint(
                size: const Size(600, 600),
                painter: PieSlicePainter(),
                // ),
              ))),
          SizedBox(height: 30),
          TextButton(
              onPressed: () {
                spinWheel();
              },
              child: const Text(
                "Press to Spin",
                style: TextStyle(fontSize: 18),
              )),
        ]);
  }

  void spinWheel() {
    if (!isSpinning) {
       isSpinning = true;
      _ticker = createTicker((duration) {
        setState(() {
          //simplfy this function to make it more maintainable and changeable
          if (duration.compareTo(Duration(milliseconds: 400)) == 0) {
            speed = 0.2;
          }
          if (duration.compareTo(Duration(milliseconds: 500)) == 0) {
            speed = 0.4;
          }
          if (duration.compareTo(Duration(milliseconds: 600)) == 0) {
            speed = 0.6;
          }
          if (duration.compareTo(Duration(milliseconds: 700)) == 0) {
            speed = 0.8;
          }
          if (duration.compareTo(Duration(milliseconds: 800)) == 0) {
            speed = 0.6;
          }
          if (duration.compareTo(Duration(milliseconds: 900)) == 0) {
            speed = 0.4;
          }
          if (duration.compareTo(Duration(milliseconds: 1000)) == 0) {
            speed = 0.2;
          }
          if (duration.compareTo(Duration(milliseconds: 1100)) == 0  || duration.compareTo(Duration(milliseconds: 1100)) > 0) {
            speed = 0;
            _ticker!.stop();
            _ticker!.dispose();
            isSpinning = false;
          }
          angleForSpin += speed;
          // print(angleForSpin);
          // print(duration);
        });
      })
        ..start();
    }
  }
}

class SpinningWheelPage extends StatelessWidget {
  const SpinningWheelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinningWheel();
  }
}

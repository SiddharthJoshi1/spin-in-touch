import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'custom_painter.dart';

class Segement {
  int index;
  String? value;
  double startRadians;
  double endRadians;

  Segement(
      {this.value,
      required this.index,
      required this.startRadians,
      required this.endRadians});
}

class SegementDifference {
  double startRadiansDifference;
  double endRadiansDifference;

  SegementDifference(
      {required this.startRadiansDifference,
      required this.endRadiansDifference});
}

class SpinningWheel extends StatefulWidget {
  const SpinningWheel({super.key});

  @override
  State<SpinningWheel> createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel>
    with SingleTickerProviderStateMixin {
  double angleForSpin = 0;
  double speed = 0.1;
  final double radiansFor360 = 360 * (pi / 180);
  Key repaintKey = Key(Random().nextDouble().toString());
  bool isSpinning = false;
  Ticker? _ticker;
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Define the animation with the curve 'easeInOut'
    _widthAnimation = Tween<double>(begin: 0, end: radiansFor360 * 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.addListener(() {
      angleForSpin = _controller.value;
      if (_controller.status == AnimationStatus.completed) {
        calculateClosestToCenter();
        print('completed');
      }
    });

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
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width,
            child: AnimatedBuilder(
              builder: (context, child) {
                return Transform.rotate(
                    angle: _widthAnimation.value,
                    child: RepaintBoundary(
                        key: repaintKey,
                        child: CustomPaint(
                          size: const Size(600, 600),
                          painter: PieSlicePainter(),
                          // ),
                        )));
              },
              animation: _widthAnimation,
            ),
          ),
          SizedBox(height: 30),
          TextButton(
              onPressed: () {
                setState(() {
                  angleForSpin = 0;
                });
                // spinWheel();
                _controller.reset();
                _controller.forward();
              },
              child: const Text(
                "Press to Spin",
                style: TextStyle(fontSize: 18),
              )),
        ]);
  }

  void calculateClosestToCenter() {
    //first figure out all the pieces degree difference
    //can find out from list of items in list
    int numberOfPieces = 10;
    // so for a list of 10 items we get 360 / numberOfSections so 36
    double difference = (2 * pi) / numberOfPieces;
    // with 36 degree difference the first's min and max will be 0 to 36 the next will be 36 to 72 and so on
    List<Segement> segements = [];
    // so create a min max list
    for (var pieceIndex = 0; pieceIndex < numberOfPieces; pieceIndex++) {
      if (pieceIndex == 0) {
        segements.add(Segement(
            index: pieceIndex, startRadians: 0, endRadians: difference));
      } else {
        segements.add(Segement(
            index: pieceIndex,
            startRadians: difference * pieceIndex,
            endRadians: difference * (pieceIndex + 1)));
      }
    }
    // increase degree diffence for each by final angle of spin
    // so if angle spun final was 22 radians
    // do degrees / 360 and take modulo from that to then add to min and max of segements
    print(angleForSpin);
    double radiansToIncreaseEachSegmentBy = angleForSpin % radiansFor360;
    print(radiansToIncreaseEachSegmentBy);
    List<SegementDifference> segementDifferences = [];
    for (var segement in segements) {
      segement.startRadians += radiansToIncreaseEachSegmentBy;
      segement.endRadians += radiansToIncreaseEachSegmentBy;

      if (segement.startRadians > radiansFor360) {
        segement.startRadians -= radiansFor360;
      }
      if (segement.endRadians > radiansFor360) {
        segement.endRadians -= radiansFor360;
      }
      // print(
      //     "segment starts at ${segement.startRadians} and ends at ${segement.endRadians}");
    }
    // print('radiansFor360 $radiansFor360');
    Segement? segementThatWon = segements.firstWhere((segement) {
      if (segement.startRadians < segement.endRadians) {
        return segement.startRadians <= radiansFor360 &&
            radiansFor360 <= segement.endRadians;
      } else {
        return segement.startRadians <= radiansFor360 ||
            radiansFor360 <= segement.endRadians;
      }
    });

    print(segementThatWon.index);

    // see which areas are closest to 0/360
  }

  void spinWheel() {
    if (!isSpinning) {
      isSpinning = true;
      _ticker = createTicker((duration) {
        angleForSpin += speed;
        setState(() {
          print(angleForSpin);
          //simplfy this function to make it more maintainable and changeable
          if (duration.compareTo(Duration(milliseconds: 1000)) < 0) {
            speed = 0.2;
          }

          if (duration.compareTo(Duration(milliseconds: 2000)) == 0 ||
              duration.compareTo(Duration(milliseconds: 2000)) > 0) {
            speed = 0;
            _ticker!.stop();
            calculateClosestToCenter();
            _ticker!.dispose();
            isSpinning = false;
          }

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

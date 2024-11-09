import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spin_in_touch/Domain/Entities/spinner_list.dart';
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
  final SpinnerList spinnerList;
  const SpinningWheel({super.key, required this.spinnerList});

  @override
  State<SpinningWheel> createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel>
    with SingleTickerProviderStateMixin {
  late double radiansFor360;
  late AnimationController _controller;
  late Animation<double> _spinnerAnimation =
      Tween<double>(begin: 0).animate(_controller);
  Segement? winningSegment;

  double roundToDegreesOfPrecision(
      int degreeOfPrecision, double doubleToRound) {
    return double.parse(doubleToRound.toStringAsFixed(degreeOfPrecision));
  }

  @override
  void initState() {
    radiansFor360 = roundToDegreesOfPrecision(4, 360 * (pi / 180));

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        calculateClosestToCenter();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void createAnimtionWithRandomEndValue() {
    int numberOfSpins = Random().nextInt(10);
    double offsetValue = Random().nextDouble() * 0.9;
    double randomSpinAmountValue = numberOfSpins + offsetValue;
    _spinnerAnimation =
        Tween<double>(begin: 0, end: radiansFor360 * randomSpinAmountValue)
            .animate(
      CurvedAnimation(
          parent: _controller, curve: Curves.easeInOutCubicEmphasized),
    );
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
          const SizedBox(height: 10),
          SizedBox(
            width: 500,
            height: 500,
            child: AnimatedBuilder(
              builder: (context, child) {
                return Transform.rotate(
                    angle: _spinnerAnimation.value,
                    child: RepaintBoundary(
                        child: CustomPaint(
                      painter: PieSlicePainter(
                          numberOfSegments:
                              widget.spinnerList.spinnerContents.length),
                      // ),
                    )));
              },
              animation: _spinnerAnimation,
            ),
          ),
          const SizedBox(height: 30),
          TextButton(
              onPressed: () {
                setState(() {
                  createAnimtionWithRandomEndValue();
                });
                _controller.reset();
                _controller.forward();
              },
              child: const Text(
                "Press to Spin",
                style: TextStyle(fontSize: 18),
              )),
          winningSegment != null
              ? Column(children: [
                  Text(
                    "Winning segment is ${winningSegment?.index}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium, // Subtitle style from the theme
                  ),
                  Text(
                    "${widget.spinnerList.spinnerContents[winningSegment!.index]}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium, // Subtitle style from the theme
                  )
                ])
              : const SizedBox.shrink(),
        ]);
  }

  List<Segement> _createSegmentsToMirrorUIWheel() {
    //first figure out all the pieces degree difference
    //can find out from list of items in list
    int numberOfPieces = widget.spinnerList.spinnerContents.length;
    // so for a list of 10 items we get 360 / numberOfSections so 36
    double difference = (2 * pi) / numberOfPieces;
    // with 36 degree difference the first's min and max will be 0 to 36 the next will be 36 to 72 and so on
    List<Segement> segements = [];
    // so create a min max list
    for (var pieceIndex = 0; pieceIndex < numberOfPieces; pieceIndex++) {
      if (pieceIndex == 0) {
        segements.add(Segement(
            index: pieceIndex,
            startRadians: 0,
            endRadians: roundToDegreesOfPrecision(4, difference)));
      } else {
        segements.add(Segement(
            index: pieceIndex,
            startRadians: roundToDegreesOfPrecision(4, difference * pieceIndex),
            endRadians:
                roundToDegreesOfPrecision(4, difference * (pieceIndex + 1))));
      }
    }
    return segements;
  }

  List<Segement> _incrementEachSegmentWithNewSpinValue(
      List<Segement> oldSegments) {
    // increase degree diffence for each by final angle of spin
    // so if angle spun final was 22 radians
    // do degrees / 360 and take modulo from that to then add to min and max of segements
    double radiansToIncreaseEachSegmentBy =
        roundToDegreesOfPrecision(4, _spinnerAnimation.value % radiansFor360);
    for (var segement in oldSegments) {
      segement.startRadians += radiansToIncreaseEachSegmentBy;
      segement.endRadians += radiansToIncreaseEachSegmentBy;

      segement.endRadians = segement.endRadians == radiansFor360
          ? segement.endRadians
          : roundToDegreesOfPrecision(4, segement.endRadians % radiansFor360);
      segement.startRadians = segement.startRadians == radiansFor360
          ? segement.startRadians
          : roundToDegreesOfPrecision(4, segement.startRadians % radiansFor360);
    }
    return oldSegments;
  }

  Segement _findWinningSegment(List<Segement> segements) {
    Segement? segementThatWon = segements.firstWhere((segement) {
      if (segement.startRadians < segement.endRadians) {
        return segement.startRadians <= radiansFor360 &&
            radiansFor360 <= segement.endRadians;
      } else {
        return segement.startRadians <= radiansFor360 ||
            radiansFor360 <= segement.endRadians;
      }
    });
    return segementThatWon;
  }

  void calculateClosestToCenter() {
    List<Segement> segements = _createSegmentsToMirrorUIWheel();
    List<Segement> newSegments =
        _incrementEachSegmentWithNewSpinValue(segements);

    setState(() {
      winningSegment = _findWinningSegment(newSegments);
    });
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spin_in_touch/features/spinner/bloc/cubit/spinner_cubit.dart';
import 'package:spin_in_touch/features/spinner/models/section.dart';
import 'package:spin_in_touch/features/spinner/utils/spinner_utils.dart';
import 'custom_painter.dart';

class SpinningWheel extends StatefulWidget {
  const SpinningWheel({super.key});

  @override
  State<SpinningWheel> createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel>
    with SingleTickerProviderStateMixin {
  late double radiansFor360;
  late AnimationController _controller;
  late Animation<double> _spinnerAnimation =
      Tween<double>(begin: 0).animate(_controller);
  Section? winningSegment;
  final SpinnerUtils _spinnerUtils = GetIt.instance<SpinnerUtils>();

  @override
  void initState() {
    radiansFor360 =
        _spinnerUtils.roundToDegreesOfPrecision(4, 360 * (pi / 180));

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        setState(() {
          winningSegment = calculateClosestToCenter();
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SpinnerState spinnerCubitState = context.read<SpinnerCubit>().state;
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
            width: 300,
            height: 300,
            child: AnimatedBuilder(
              builder: (context, child) {
                return Transform.rotate(
                    angle: _spinnerAnimation.value,
                    child: RepaintBoundary(
                        child: CustomPaint(
                      painter: PieSlicePainter(
                          numberOfSections: spinnerCubitState
                                  .spinnerList?.spinnerContents.length ??
                              0),
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
                  _spinnerAnimation = _spinnerUtils.createAnimtionWithRandomEndValue(_controller);
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
                    "${spinnerCubitState.spinnerList?.spinnerContents[winningSegment!.index]}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium, // Subtitle style from the theme
                  )
                ])
              : const SizedBox.shrink(),
        ]);
  }

  List<Section> _createSegmentsToMirrorUIWheel(SpinnerState spinnerCubitState) {
    //first figure out all the pieces degree difference
    //can find out from list of items in list
    int numberOfPieces =
        spinnerCubitState.spinnerList?.spinnerContents.length ?? 0;
    // so for a list of 10 items we get 360 / numberOfSections so 36
    double difference = (2 * pi) / numberOfPieces;
    // with 36 degree difference the first's min and max will be 0 to 36 the next will be 36 to 72 and so on
    List<Section> sections = [];
    // so create a min max list
    for (var pieceIndex = 0; pieceIndex < numberOfPieces; pieceIndex++) {
      if (pieceIndex == 0) {
        sections.add(Section(
            index: pieceIndex,
            startRadians: 0,
            endRadians: _spinnerUtils.roundToDegreesOfPrecision(4, difference)));
      } else {
        sections.add(Section(
            index: pieceIndex,
            startRadians: _spinnerUtils.roundToDegreesOfPrecision(4, difference * pieceIndex),
            endRadians:
                _spinnerUtils.roundToDegreesOfPrecision(4, difference * (pieceIndex + 1))));
      }
    }
    return sections;
  }

  List<Section> _incrementEachSegmentWithNewSpinValue(
      List<Section> oldSegments) {
    // increase degree diffence for each by final angle of spin
    // so if angle spun final was 22 radians
    // do degrees / 360 and take modulo from that to then add to min and max of sections
    double radiansToIncreaseEachSegmentBy =
        _spinnerUtils
        .roundToDegreesOfPrecision(4, _spinnerAnimation.value % radiansFor360);
    for (var section in oldSegments) {
      section.startRadians += radiansToIncreaseEachSegmentBy;
      section.endRadians += radiansToIncreaseEachSegmentBy;

      section.endRadians = section.endRadians == radiansFor360
          ? section.endRadians
          : _spinnerUtils.roundToDegreesOfPrecision(4, section.endRadians % radiansFor360);
      section.startRadians = section.startRadians == radiansFor360
          ? section.startRadians
          : _spinnerUtils.roundToDegreesOfPrecision(4, section.startRadians % radiansFor360);
    }
    return oldSegments;
  }

  Section _findWinningSegment(List<Section> sections) {
    Section? sectionThatWon = sections.firstWhere((section) {
      if (section.startRadians < section.endRadians) {
        return section.startRadians <= radiansFor360 &&
            radiansFor360 <= section.endRadians;
      } else {
        return section.startRadians <= radiansFor360 ||
            radiansFor360 <= section.endRadians;
      }
    });
    return sectionThatWon;
  }

  Section calculateClosestToCenter() {
    List<Section> sections =
        _createSegmentsToMirrorUIWheel(context.read<SpinnerCubit>().state);
    List<Section> newSegments = _incrementEachSegmentWithNewSpinValue(sections);

    return _findWinningSegment(newSegments);
  }
}

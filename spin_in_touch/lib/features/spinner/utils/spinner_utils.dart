import 'dart:math';

import 'package:flutter/material.dart';

class SpinnerUtils {
  double roundToDegreesOfPrecision(
      int degreeOfPrecision, double doubleToRound) {
    return double.parse(doubleToRound.toStringAsFixed(degreeOfPrecision));
  }

  Animation<double> createAnimtionWithRandomEndValue(
      AnimationController controller) {
    int numberOfSpins = Random().nextInt(10);
    double offsetValue = Random().nextDouble() * 0.9;
    double randomSpinAmountValue = numberOfSpins + offsetValue;
    return Tween<double>(
            begin: 0,
            end: roundToDegreesOfPrecision(4, pi * 2) * randomSpinAmountValue)
        .animate(
      CurvedAnimation(
          parent: controller, curve: Curves.easeInOutCubicEmphasized),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spin_in_touch/spinner/bloc/cubit/spinner_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/spinning_wheel.dart';

class SpinnerWidget extends StatelessWidget {
  const SpinnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpinnerCubit, SpinnerState>(
      builder: (context, state) {
        return switch (state.spinnerStatus) {
          SpinnerStatus.initial => const Text("Initial"),
          SpinnerStatus.loading => const Text(
              'Loading Spinner',
            ),
          SpinnerStatus.success => const SpinningWheel(),
          SpinnerStatus.failure => const Text("shite it's f***ed"),
          SpinnerStatus.complete => const Text("so what'd you win?"),
        };
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spin_in_touch/spinner/bloc/cubit/spinner_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpinnerWidget extends StatelessWidget {
  const SpinnerWidget({super.key});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BlocBuilder<SpinnerCubit, SpinnerState>(
      builder: (context, state) {
        
        return switch (state.spinnerStatus) {
          // TODO: Handle this case.
          SpinnerStatus.initial => Container(child: Text("Initial"),),
          // TODO: Handle this case.
          SpinnerStatus.loading => const Text(
              'Loading Spinner',
            ),

          // TODO: Handle this case.
          SpinnerStatus.success => Container(child:  Text(state.spinnerList!.spinnerContents[0].toString()) ),
          // TODO: Handle this case.
          SpinnerStatus.failure => Container(
              child: const Text("shite it's f***ed"),
            ),

          // TODO: Handle this case.
          SpinnerStatus.complete => Container(
              child: const Text("so what'd you win?"),
            ),
        };
      },
    );
  }
}

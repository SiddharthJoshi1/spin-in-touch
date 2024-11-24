import 'package:flutter/material.dart';
import 'package:spin_in_touch/features/spinner/widgets/spinner.dart';

class SpinnerAppView extends StatelessWidget {
  const SpinnerAppView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.amber,
              title: Text(
                "Spin in Touch",
                style: Theme.of(context).textTheme.headlineLarge,
              )),
          body: const Center(child: SpinnerWidget()));
  }
}

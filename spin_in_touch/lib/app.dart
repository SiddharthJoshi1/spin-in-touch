import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spin_in_touch/Domain/Repos/spinner_repository.dart';
import 'package:spin_in_touch/spinner/bloc/cubit/spinner_cubit.dart';
import 'package:spin_in_touch/spinner/widgets/spinner.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.spinnerRepository});

  final SpinnerRepository spinnerRepository;
  
  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (_) => SpinnerCubit(spinnerRepository)..fetchSpinnerContents(),
      child: SpinnerAppView(),
    );
  }

}

class SpinnerAppView extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spinner',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(centerTitle: true, backgroundColor: Colors.amber, title: Text("Spin in Touch", style: Theme.of(context).textTheme.headlineLarge, )),
        body: Center(child:  SpinnerWidget())),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spin_in_touch/Domain/Repos/spinner_repository.dart';
import 'package:spin_in_touch/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spinner',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: HomePage(spinnerRepository: GetIt.instance<SpinnerRepository>(),)
    );
  }
}

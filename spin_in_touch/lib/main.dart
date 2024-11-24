import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spin_in_touch/Domain/Repos/spinner_repository.dart';
import 'package:spin_in_touch/app.dart';
import 'package:spin_in_touch/dependency_injection.dart';

void main() {
  DependencyInjection();
  runApp(MyApp(
    spinnerRepository: GetIt.instance<SpinnerRepository>()
  ));
}

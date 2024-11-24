import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spin_in_touch/Domain/Repos/spinner_repository.dart';
import 'package:spin_in_touch/features/spinner/bloc/cubit/spinner_cubit.dart';
import 'package:spin_in_touch/features/spinner/pages/spinner_page.dart';

class HomePage extends StatelessWidget {

final SpinnerRepository spinnerRepository;

  const HomePage({super.key, required this.spinnerRepository});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return BlocProvider(
      create: (_) => SpinnerCubit(spinnerRepository)..fetchSpinnerContents(),
      child: const SpinnerAppView(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spin_in_touch/Domain/Repos/spinner_repository.dart';
import 'package:spin_in_touch/features/theme/cubit/theme_cubit.dart';
import 'package:spin_in_touch/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return     MaterialApp(
        title: 'Spinner',
        themeMode: state.themeMode,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        theme: ThemeData(
          
          useMaterial3: true,
        ),
        home: HomePage(
          spinnerRepository: GetIt.instance<SpinnerRepository>(),
        ));
      },
    );

  }
}

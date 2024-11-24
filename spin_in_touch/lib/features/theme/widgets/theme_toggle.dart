import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spin_in_touch/features/theme/cubit/theme_cubit.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () =>
                context.read<ThemeCubit>().setTheme(ThemeMode.system),
            child: Text('System'),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () =>
                context.read<ThemeCubit>().setTheme(ThemeMode.light),
            child: Text('Light'),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () =>
                context.read<ThemeCubit>().setTheme(ThemeMode.dark),
            child: Text('Dark'),
          ),
        ],
      );
  }
}

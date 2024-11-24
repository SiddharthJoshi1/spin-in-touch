import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState(ThemeMode.values.firstWhere(
        (element) => element.name == json["themeMode"],
        orElse: () => ThemeMode.system));
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {"themeMode": state.themeMode.name};
  }

  ThemeCubit() : super(const ThemeState(ThemeMode.system));

  void setTheme(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
  
}

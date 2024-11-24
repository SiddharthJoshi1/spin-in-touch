import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spin_in_touch/app.dart';
import 'package:spin_in_touch/dependency_injection.dart';
import 'package:spin_in_touch/features/theme/cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  DependencyInjection();
  
  runApp(MultiBlocProvider(
    providers: [BlocProvider<ThemeCubit>(create: (context) => ThemeCubit())],
    child: const MyApp(),
  ));
}

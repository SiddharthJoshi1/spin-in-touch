import 'package:get_it/get_it.dart';
import 'package:spin_in_touch/Data/sources/local_file.dart';
import 'package:spin_in_touch/Data/spinner_repository_impl.dart';
import 'package:spin_in_touch/Domain/Repos/spinner_repository.dart';
import 'package:spin_in_touch/features/spinner/utils/spinner_utils.dart';

class DependencyInjection {
  final GetIt _getIt = GetIt.instance;

  DependencyInjection() {
    registerDependencies();
  }

  void _registerUtils() {
    _getIt.registerFactory<SpinnerUtils>(() => SpinnerUtils());
  }

  void _registerDataSources() {
    _getIt
        .registerFactory<LocalFileJSONParser>(() => LocalFileJSONParserImpl());
  }

  void _registerRepos() {
    _getIt.registerLazySingleton<SpinnerRepository>(() => SpinnerRepositoryImpl(
        localFileJSONParser: _getIt<LocalFileJSONParser>()));
  }

  void registerDependencies() {
    _registerDataSources();
    _registerRepos();
    _registerUtils();
  }
}

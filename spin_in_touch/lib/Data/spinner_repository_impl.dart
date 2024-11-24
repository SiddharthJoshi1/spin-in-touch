import 'package:spin_in_touch/Data/sources/local_file.dart';
import 'package:spin_in_touch/Domain/Entities/spinner_list.dart';
import 'package:spin_in_touch/Domain/Repos/spinner_repository.dart';

class SpinnerRepositoryImpl extends SpinnerRepository {
  final LocalFileJSONParser _localFileJSONParser;
  SpinnerRepositoryImpl({required LocalFileJSONParser localFileJSONParser})
      : _localFileJSONParser = localFileJSONParser;

  @override
  Future<SpinnerList> getSpinnerList() async {
    SpinnerList spinnerList = await _localFileJSONParser.loadSpinnerContents();
    return spinnerList;
  }
}

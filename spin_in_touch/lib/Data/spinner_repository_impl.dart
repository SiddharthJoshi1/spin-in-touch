import 'package:spin_in_touch/Domain/Entities/spinner_list.dart';
import 'package:spin_in_touch/Domain/Repos/spinner_repository.dart';

class SpinnerRepositoryImpl extends SpinnerRepository {
  SpinnerRepositoryImpl({required super.localFileJSONParser});

  @override
  Future<SpinnerList> getSpinnerList() async {
    SpinnerList spinnerList = await localFileJSONParser.loadSpinnerContents();
    return spinnerList;
  }
  
}
import 'package:spin_in_touch/Domain/Entities/spinner_list.dart';
import 'package:spin_in_touch/Domain/Repos/spinner_repository.dart';

class GetSpinnerList {
  final SpinnerRepository _spinnerRepository;

  GetSpinnerList({required SpinnerRepository spinnerRepository})
      : _spinnerRepository = spinnerRepository;

  Future<SpinnerList> getSpinnerList() async {
    SpinnerList spinnerList = await _spinnerRepository.getSpinnerList();
    return spinnerList;
  }
}

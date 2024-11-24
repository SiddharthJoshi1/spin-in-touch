import 'package:spin_in_touch/Domain/Entities/spinner_list.dart';

abstract class SpinnerRepository {
  SpinnerRepository();
  Future<SpinnerList> getSpinnerList();
}

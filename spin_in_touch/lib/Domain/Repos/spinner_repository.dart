import 'package:spin_in_touch/Data/sources/local_file.dart';
import 'package:spin_in_touch/Domain/Entities/spinner_list.dart';

abstract class SpinnerRepository {
  final LocalFileJSONParser localFileJSONParser;
  SpinnerRepository({required this.localFileJSONParser});
  Future<SpinnerList> getSpinnerList();
}

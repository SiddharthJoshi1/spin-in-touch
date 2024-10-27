import 'package:freezed_annotation/freezed_annotation.dart';
part 'spinner_list.freezed.dart';
part 'spinner_list.g.dart';

@freezed
class SpinnerList with _$SpinnerList {
  factory SpinnerList(List<String> spinnerContents) = _SpinnerList;

  factory SpinnerList.fromJson(Map<String, Object?> json)
      => _$SpinnerListFromJson(json);

}

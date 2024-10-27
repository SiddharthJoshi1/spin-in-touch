part of 'spinner_cubit.dart';

enum SpinnerStatus { initial, loading, success, failure, complete }

@freezed
class SpinnerState with _$SpinnerState {
  factory SpinnerState(SpinnerStatus spinnerStatus, SpinnerList? spinnerList, String chosenValue) =
      _SpinnerState;
}

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spin_in_touch/Domain/Entities/spinner_list.dart';
import 'package:spin_in_touch/Domain/Repos/spinner_repository.dart';

part 'spinner_state.dart';
part 'spinner_cubit.freezed.dart';

class SpinnerCubit extends Cubit<SpinnerState> {
  SpinnerCubit(SpinnerRepository spinnerRepository)
      : _spinnerRepository = spinnerRepository,
        super(SpinnerState(SpinnerStatus.initial, null, ""));

  final SpinnerRepository _spinnerRepository;

  Future<void> fetchSpinnerContents() async {
    //start the loading process
    emit(state.copyWith(spinnerStatus: SpinnerStatus.loading));

    try {
      SpinnerList spinnerList = await _spinnerRepository.getSpinnerList();
      emit(state.copyWith(spinnerList: spinnerList, spinnerStatus: SpinnerStatus.success));

    } catch (exception) {
      emit(state.copyWith(spinnerStatus: SpinnerStatus.failure));
    }
  }

  setChosenSpinnerItem(String chosenItem) {
    emit(state.copyWith(spinnerStatus: SpinnerStatus.complete, chosenValue: chosenItem));
  }
}

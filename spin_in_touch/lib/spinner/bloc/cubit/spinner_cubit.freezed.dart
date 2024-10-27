// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spinner_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpinnerState {
  SpinnerStatus get spinnerStatus => throw _privateConstructorUsedError;
  SpinnerList? get spinnerList => throw _privateConstructorUsedError;
  String get chosenValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpinnerStateCopyWith<SpinnerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpinnerStateCopyWith<$Res> {
  factory $SpinnerStateCopyWith(
          SpinnerState value, $Res Function(SpinnerState) then) =
      _$SpinnerStateCopyWithImpl<$Res, SpinnerState>;
  @useResult
  $Res call(
      {SpinnerStatus spinnerStatus,
      SpinnerList? spinnerList,
      String chosenValue});

  $SpinnerListCopyWith<$Res>? get spinnerList;
}

/// @nodoc
class _$SpinnerStateCopyWithImpl<$Res, $Val extends SpinnerState>
    implements $SpinnerStateCopyWith<$Res> {
  _$SpinnerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spinnerStatus = null,
    Object? spinnerList = freezed,
    Object? chosenValue = null,
  }) {
    return _then(_value.copyWith(
      spinnerStatus: null == spinnerStatus
          ? _value.spinnerStatus
          : spinnerStatus // ignore: cast_nullable_to_non_nullable
              as SpinnerStatus,
      spinnerList: freezed == spinnerList
          ? _value.spinnerList
          : spinnerList // ignore: cast_nullable_to_non_nullable
              as SpinnerList?,
      chosenValue: null == chosenValue
          ? _value.chosenValue
          : chosenValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpinnerListCopyWith<$Res>? get spinnerList {
    if (_value.spinnerList == null) {
      return null;
    }

    return $SpinnerListCopyWith<$Res>(_value.spinnerList!, (value) {
      return _then(_value.copyWith(spinnerList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpinnerStateImplCopyWith<$Res>
    implements $SpinnerStateCopyWith<$Res> {
  factory _$$SpinnerStateImplCopyWith(
          _$SpinnerStateImpl value, $Res Function(_$SpinnerStateImpl) then) =
      __$$SpinnerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SpinnerStatus spinnerStatus,
      SpinnerList? spinnerList,
      String chosenValue});

  @override
  $SpinnerListCopyWith<$Res>? get spinnerList;
}

/// @nodoc
class __$$SpinnerStateImplCopyWithImpl<$Res>
    extends _$SpinnerStateCopyWithImpl<$Res, _$SpinnerStateImpl>
    implements _$$SpinnerStateImplCopyWith<$Res> {
  __$$SpinnerStateImplCopyWithImpl(
      _$SpinnerStateImpl _value, $Res Function(_$SpinnerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spinnerStatus = null,
    Object? spinnerList = freezed,
    Object? chosenValue = null,
  }) {
    return _then(_$SpinnerStateImpl(
      null == spinnerStatus
          ? _value.spinnerStatus
          : spinnerStatus // ignore: cast_nullable_to_non_nullable
              as SpinnerStatus,
      freezed == spinnerList
          ? _value.spinnerList
          : spinnerList // ignore: cast_nullable_to_non_nullable
              as SpinnerList?,
      null == chosenValue
          ? _value.chosenValue
          : chosenValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SpinnerStateImpl with DiagnosticableTreeMixin implements _SpinnerState {
  _$SpinnerStateImpl(this.spinnerStatus, this.spinnerList, this.chosenValue);

  @override
  final SpinnerStatus spinnerStatus;
  @override
  final SpinnerList? spinnerList;
  @override
  final String chosenValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpinnerState(spinnerStatus: $spinnerStatus, spinnerList: $spinnerList, chosenValue: $chosenValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpinnerState'))
      ..add(DiagnosticsProperty('spinnerStatus', spinnerStatus))
      ..add(DiagnosticsProperty('spinnerList', spinnerList))
      ..add(DiagnosticsProperty('chosenValue', chosenValue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpinnerStateImpl &&
            (identical(other.spinnerStatus, spinnerStatus) ||
                other.spinnerStatus == spinnerStatus) &&
            (identical(other.spinnerList, spinnerList) ||
                other.spinnerList == spinnerList) &&
            (identical(other.chosenValue, chosenValue) ||
                other.chosenValue == chosenValue));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, spinnerStatus, spinnerList, chosenValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpinnerStateImplCopyWith<_$SpinnerStateImpl> get copyWith =>
      __$$SpinnerStateImplCopyWithImpl<_$SpinnerStateImpl>(this, _$identity);
}

abstract class _SpinnerState implements SpinnerState {
  factory _SpinnerState(
      final SpinnerStatus spinnerStatus,
      final SpinnerList? spinnerList,
      final String chosenValue) = _$SpinnerStateImpl;

  @override
  SpinnerStatus get spinnerStatus;
  @override
  SpinnerList? get spinnerList;
  @override
  String get chosenValue;
  @override
  @JsonKey(ignore: true)
  _$$SpinnerStateImplCopyWith<_$SpinnerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

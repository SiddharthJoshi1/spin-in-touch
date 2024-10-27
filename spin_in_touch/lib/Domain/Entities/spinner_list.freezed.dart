// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spinner_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpinnerList _$SpinnerListFromJson(Map<String, dynamic> json) {
  return _SpinnerList.fromJson(json);
}

/// @nodoc
mixin _$SpinnerList {
  List<String> get spinnerContents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpinnerListCopyWith<SpinnerList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpinnerListCopyWith<$Res> {
  factory $SpinnerListCopyWith(
          SpinnerList value, $Res Function(SpinnerList) then) =
      _$SpinnerListCopyWithImpl<$Res, SpinnerList>;
  @useResult
  $Res call({List<String> spinnerContents});
}

/// @nodoc
class _$SpinnerListCopyWithImpl<$Res, $Val extends SpinnerList>
    implements $SpinnerListCopyWith<$Res> {
  _$SpinnerListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spinnerContents = null,
  }) {
    return _then(_value.copyWith(
      spinnerContents: null == spinnerContents
          ? _value.spinnerContents
          : spinnerContents // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpinnerListImplCopyWith<$Res>
    implements $SpinnerListCopyWith<$Res> {
  factory _$$SpinnerListImplCopyWith(
          _$SpinnerListImpl value, $Res Function(_$SpinnerListImpl) then) =
      __$$SpinnerListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> spinnerContents});
}

/// @nodoc
class __$$SpinnerListImplCopyWithImpl<$Res>
    extends _$SpinnerListCopyWithImpl<$Res, _$SpinnerListImpl>
    implements _$$SpinnerListImplCopyWith<$Res> {
  __$$SpinnerListImplCopyWithImpl(
      _$SpinnerListImpl _value, $Res Function(_$SpinnerListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spinnerContents = null,
  }) {
    return _then(_$SpinnerListImpl(
      null == spinnerContents
          ? _value._spinnerContents
          : spinnerContents // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpinnerListImpl implements _SpinnerList {
  _$SpinnerListImpl(final List<String> spinnerContents)
      : _spinnerContents = spinnerContents;

  factory _$SpinnerListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpinnerListImplFromJson(json);

  final List<String> _spinnerContents;
  @override
  List<String> get spinnerContents {
    if (_spinnerContents is EqualUnmodifiableListView) return _spinnerContents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spinnerContents);
  }

  @override
  String toString() {
    return 'SpinnerList(spinnerContents: $spinnerContents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpinnerListImpl &&
            const DeepCollectionEquality()
                .equals(other._spinnerContents, _spinnerContents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_spinnerContents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpinnerListImplCopyWith<_$SpinnerListImpl> get copyWith =>
      __$$SpinnerListImplCopyWithImpl<_$SpinnerListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpinnerListImplToJson(
      this,
    );
  }
}

abstract class _SpinnerList implements SpinnerList {
  factory _SpinnerList(final List<String> spinnerContents) = _$SpinnerListImpl;

  factory _SpinnerList.fromJson(Map<String, dynamic> json) =
      _$SpinnerListImpl.fromJson;

  @override
  List<String> get spinnerContents;
  @override
  @JsonKey(ignore: true)
  _$$SpinnerListImplCopyWith<_$SpinnerListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

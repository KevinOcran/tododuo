// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dispatch_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DispatchProfile _$DispatchProfileFromJson(Map<String, dynamic> json) {
  return _DispatchProfile.fromJson(json);
}

/// @nodoc
mixin _$DispatchProfile {
  String get id => throw _privateConstructorUsedError;
  String get vehicleNumberPlate => throw _privateConstructorUsedError;

  /// Serializes this DispatchProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DispatchProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DispatchProfileCopyWith<DispatchProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DispatchProfileCopyWith<$Res> {
  factory $DispatchProfileCopyWith(
    DispatchProfile value,
    $Res Function(DispatchProfile) then,
  ) = _$DispatchProfileCopyWithImpl<$Res, DispatchProfile>;
  @useResult
  $Res call({String id, String vehicleNumberPlate});
}

/// @nodoc
class _$DispatchProfileCopyWithImpl<$Res, $Val extends DispatchProfile>
    implements $DispatchProfileCopyWith<$Res> {
  _$DispatchProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DispatchProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? vehicleNumberPlate = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicleNumberPlate: null == vehicleNumberPlate
                ? _value.vehicleNumberPlate
                : vehicleNumberPlate // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DispatchProfileImplCopyWith<$Res>
    implements $DispatchProfileCopyWith<$Res> {
  factory _$$DispatchProfileImplCopyWith(
    _$DispatchProfileImpl value,
    $Res Function(_$DispatchProfileImpl) then,
  ) = __$$DispatchProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String vehicleNumberPlate});
}

/// @nodoc
class __$$DispatchProfileImplCopyWithImpl<$Res>
    extends _$DispatchProfileCopyWithImpl<$Res, _$DispatchProfileImpl>
    implements _$$DispatchProfileImplCopyWith<$Res> {
  __$$DispatchProfileImplCopyWithImpl(
    _$DispatchProfileImpl _value,
    $Res Function(_$DispatchProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DispatchProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? vehicleNumberPlate = null}) {
    return _then(
      _$DispatchProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicleNumberPlate: null == vehicleNumberPlate
            ? _value.vehicleNumberPlate
            : vehicleNumberPlate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DispatchProfileImpl implements _DispatchProfile {
  const _$DispatchProfileImpl({
    required this.id,
    required this.vehicleNumberPlate,
  });

  factory _$DispatchProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$DispatchProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String vehicleNumberPlate;

  @override
  String toString() {
    return 'DispatchProfile(id: $id, vehicleNumberPlate: $vehicleNumberPlate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DispatchProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicleNumberPlate, vehicleNumberPlate) ||
                other.vehicleNumberPlate == vehicleNumberPlate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, vehicleNumberPlate);

  /// Create a copy of DispatchProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DispatchProfileImplCopyWith<_$DispatchProfileImpl> get copyWith =>
      __$$DispatchProfileImplCopyWithImpl<_$DispatchProfileImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DispatchProfileImplToJson(this);
  }
}

abstract class _DispatchProfile implements DispatchProfile {
  const factory _DispatchProfile({
    required final String id,
    required final String vehicleNumberPlate,
  }) = _$DispatchProfileImpl;

  factory _DispatchProfile.fromJson(Map<String, dynamic> json) =
      _$DispatchProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get vehicleNumberPlate;

  /// Create a copy of DispatchProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DispatchProfileImplCopyWith<_$DispatchProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

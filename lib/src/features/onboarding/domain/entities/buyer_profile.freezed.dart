// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buyer_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BuyerProfile _$BuyerProfileFromJson(Map<String, dynamic> json) {
  return _BuyerProfile.fromJson(json);
}

/// @nodoc
mixin _$BuyerProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this BuyerProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuyerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuyerProfileCopyWith<BuyerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyerProfileCopyWith<$Res> {
  factory $BuyerProfileCopyWith(
    BuyerProfile value,
    $Res Function(BuyerProfile) then,
  ) = _$BuyerProfileCopyWithImpl<$Res, BuyerProfile>;
  @useResult
  $Res call({String id, String name, String phoneNumber});
}

/// @nodoc
class _$BuyerProfileCopyWithImpl<$Res, $Val extends BuyerProfile>
    implements $BuyerProfileCopyWith<$Res> {
  _$BuyerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BuyerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            phoneNumber: null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BuyerProfileImplCopyWith<$Res>
    implements $BuyerProfileCopyWith<$Res> {
  factory _$$BuyerProfileImplCopyWith(
    _$BuyerProfileImpl value,
    $Res Function(_$BuyerProfileImpl) then,
  ) = __$$BuyerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String phoneNumber});
}

/// @nodoc
class __$$BuyerProfileImplCopyWithImpl<$Res>
    extends _$BuyerProfileCopyWithImpl<$Res, _$BuyerProfileImpl>
    implements _$$BuyerProfileImplCopyWith<$Res> {
  __$$BuyerProfileImplCopyWithImpl(
    _$BuyerProfileImpl _value,
    $Res Function(_$BuyerProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BuyerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
  }) {
    return _then(
      _$BuyerProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BuyerProfileImpl implements _BuyerProfile {
  const _$BuyerProfileImpl({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  factory _$BuyerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuyerProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'BuyerProfile(id: $id, name: $name, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyerProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phoneNumber);

  /// Create a copy of BuyerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyerProfileImplCopyWith<_$BuyerProfileImpl> get copyWith =>
      __$$BuyerProfileImplCopyWithImpl<_$BuyerProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuyerProfileImplToJson(this);
  }
}

abstract class _BuyerProfile implements BuyerProfile {
  const factory _BuyerProfile({
    required final String id,
    required final String name,
    required final String phoneNumber,
  }) = _$BuyerProfileImpl;

  factory _BuyerProfile.fromJson(Map<String, dynamic> json) =
      _$BuyerProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phoneNumber;

  /// Create a copy of BuyerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuyerProfileImplCopyWith<_$BuyerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SellerProfile _$SellerProfileFromJson(Map<String, dynamic> json) {
  return _SellerProfile.fromJson(json);
}

/// @nodoc
mixin _$SellerProfile {
  String get id => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;

  /// Serializes this SellerProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SellerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerProfileCopyWith<SellerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerProfileCopyWith<$Res> {
  factory $SellerProfileCopyWith(
    SellerProfile value,
    $Res Function(SellerProfile) then,
  ) = _$SellerProfileCopyWithImpl<$Res, SellerProfile>;
  @useResult
  $Res call({String id, String storeName});
}

/// @nodoc
class _$SellerProfileCopyWithImpl<$Res, $Val extends SellerProfile>
    implements $SellerProfileCopyWith<$Res> {
  _$SellerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? storeName = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            storeName: null == storeName
                ? _value.storeName
                : storeName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SellerProfileImplCopyWith<$Res>
    implements $SellerProfileCopyWith<$Res> {
  factory _$$SellerProfileImplCopyWith(
    _$SellerProfileImpl value,
    $Res Function(_$SellerProfileImpl) then,
  ) = __$$SellerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String storeName});
}

/// @nodoc
class __$$SellerProfileImplCopyWithImpl<$Res>
    extends _$SellerProfileCopyWithImpl<$Res, _$SellerProfileImpl>
    implements _$$SellerProfileImplCopyWith<$Res> {
  __$$SellerProfileImplCopyWithImpl(
    _$SellerProfileImpl _value,
    $Res Function(_$SellerProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SellerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? storeName = null}) {
    return _then(
      _$SellerProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        storeName: null == storeName
            ? _value.storeName
            : storeName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerProfileImpl implements _SellerProfile {
  const _$SellerProfileImpl({required this.id, required this.storeName});

  factory _$SellerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String storeName;

  @override
  String toString() {
    return 'SellerProfile(id: $id, storeName: $storeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, storeName);

  /// Create a copy of SellerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerProfileImplCopyWith<_$SellerProfileImpl> get copyWith =>
      __$$SellerProfileImplCopyWithImpl<_$SellerProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerProfileImplToJson(this);
  }
}

abstract class _SellerProfile implements SellerProfile {
  const factory _SellerProfile({
    required final String id,
    required final String storeName,
  }) = _$SellerProfileImpl;

  factory _SellerProfile.fromJson(Map<String, dynamic> json) =
      _$SellerProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get storeName;

  /// Create a copy of SellerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerProfileImplCopyWith<_$SellerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

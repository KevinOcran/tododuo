// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  sellerId: json['sellerId'] as String,
  description: json['description'] as String?,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sellerId': instance.sellerId,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };

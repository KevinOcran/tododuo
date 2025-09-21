// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      storeId: json['storeId'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'storeId': instance.storeId,
      'price': instance.price,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
    };

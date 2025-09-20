// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: const DocumentReferenceConverter().fromJson(
    json['id'] as DocumentReference<Object?>?,
  ),
  title: json['title'] as String,
  isDone: json['isDone'] as bool? ?? false,
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': const DocumentReferenceConverter().toJson(instance.id),
  'title': instance.title,
  'isDone': instance.isDone,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};

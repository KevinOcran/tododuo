import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  const Task._();

  const factory Task({
    @DocumentReferenceConverter() DocumentReference? id,
    required String title,
    @Default(false) bool isDone,
    @TimestampConverter() required DateTime createdAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

class DocumentReferenceConverter implements JsonConverter<DocumentReference?, DocumentReference?> {
  const DocumentReferenceConverter();

  @override
  DocumentReference? fromJson(DocumentReference? json) => json;

  @override
  DocumentReference? toJson(DocumentReference? object) => object;
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
class Store with _$Store {
  const factory Store({
    required String id,
    required String name,
    required String sellerId,
    String? description,
    String? imageUrl,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

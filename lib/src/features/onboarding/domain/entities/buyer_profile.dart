import 'package:freezed_annotation/freezed_annotation.dart';

part 'buyer_profile.freezed.dart';
part 'buyer_profile.g.dart';

@freezed
class BuyerProfile with _$BuyerProfile {
  const factory BuyerProfile({
    required String id,
    required String name,
    required String phoneNumber,
  }) = _BuyerProfile;

  factory BuyerProfile.fromJson(Map<String, dynamic> json) =>
      _$BuyerProfileFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_profile.freezed.dart';
part 'seller_profile.g.dart';

@freezed
class SellerProfile with _$SellerProfile {
  const factory SellerProfile({required String id, required String storeName}) =
      _SellerProfile;

  factory SellerProfile.fromJson(Map<String, dynamic> json) =>
      _$SellerProfileFromJson(json);
}

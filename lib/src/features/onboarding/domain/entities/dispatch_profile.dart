import 'package:freezed_annotation/freezed_annotation.dart';

part 'dispatch_profile.freezed.dart';
part 'dispatch_profile.g.dart';

@freezed
class DispatchProfile with _$DispatchProfile {
  const factory DispatchProfile({
    required String id,
    required String vehicleNumberPlate,
  }) = _DispatchProfile;

  factory DispatchProfile.fromJson(Map<String, dynamic> json) =>
      _$DispatchProfileFromJson(json);
}

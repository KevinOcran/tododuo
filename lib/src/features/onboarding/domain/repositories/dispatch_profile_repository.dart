import '../entities/dispatch_profile.dart';

abstract class DispatchProfileRepository {
  Future<void> createDispatchProfile(DispatchProfile dispatchProfile);
  Future<DispatchProfile> getDispatchProfile(String id);
  Future<void> updateDispatchProfile(DispatchProfile dispatchProfile);
}

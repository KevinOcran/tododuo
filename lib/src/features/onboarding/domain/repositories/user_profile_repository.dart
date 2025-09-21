import '../entities/user_profile.dart';

abstract class UserProfileRepository {
  Future<void> createUserProfile(UserProfile userProfile);
  Future<UserProfile> getUserProfile(String id);
  Future<void> updateUserProfile(UserProfile userprofile);
}

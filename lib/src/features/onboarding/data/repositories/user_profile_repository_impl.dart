import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final FirebaseFirestore _firestore;

  UserProfileRepositoryImpl(this._firestore);

  @override
  Future<void> createUserProfile(UserProfile userProfile) {
    return _firestore
        .collection('users')
        .doc(userProfile.id)
        .set(userProfile.toJson());
  }

  @override
  Future<UserProfile> getUserProfile(String id) async {
    final doc = await _firestore.collection('users').doc(id).get();
    return UserProfile.fromJson(doc.data()!);
  }

  @override
  Future<void> updateUserProfile(UserProfile userProfile) {
    return _firestore
        .collection('users')
        .doc(userProfile.id)
        .update(userProfile.toJson());
  }
}

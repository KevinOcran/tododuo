import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/dispatch_profile.dart';
import '../../domain/repositories/dispatch_profile_repository.dart';

class DispatchProfileRepositoryImpl implements DispatchProfileRepository {
  final FirebaseFirestore _firestore;

  DispatchProfileRepositoryImpl(this._firestore);

  @override
  Future<void> createDispatchProfile(DispatchProfile dispatchProfile) {
    return _firestore
        .collection('dispatchers')
        .doc(dispatchProfile.id)
        .set(dispatchProfile.toJson());
  }

  @override
  Future<DispatchProfile> getDispatchProfile(String id) async {
    final doc = await _firestore.collection('dispatchers').doc(id).get();
    return DispatchProfile.fromJson(doc.data()!);
  }

  @override
  Future<void> updateDispatchProfile(DispatchProfile dispatchProfile) {
    return _firestore
        .collection('dispatchers')
        .doc(dispatchProfile.id)
        .update(dispatchProfile.toJson());
  }
}

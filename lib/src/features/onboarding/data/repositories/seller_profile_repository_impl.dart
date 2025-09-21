import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/seller_profile.dart';
import '../../domain/repositories/seller_profile_repository.dart';

class SellerProfileRepositoryImpl implements SellerProfileRepository {
  final FirebaseFirestore _firestore;

  SellerProfileRepositoryImpl(this._firestore);

  @override
  Future<void> createSellerProfile(SellerProfile sellerProfile) {
    return _firestore
        .collection('sellers')
        .doc(sellerProfile.id)
        .set(sellerProfile.toJson());
  }

  @override
  Future<SellerProfile> getSellerProfile(String id) async {
    final doc = await _firestore.collection('sellers').doc(id).get();
    return SellerProfile.fromJson(doc.data()!);
  }

  @override
  Future<void> updateSellerProfile(SellerProfile sellerProfile) {
    return _firestore
        .collection('sellers')
        .doc(sellerProfile.id)
        .update(sellerProfile.toJson());
  }
}

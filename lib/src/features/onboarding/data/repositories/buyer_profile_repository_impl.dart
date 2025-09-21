import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/buyer_profile.dart';
import '../../domain/repositories/buyer_profile_repository.dart';

class BuyerProfileRepositoryImpl implements BuyerProfileRepository {
  final FirebaseFirestore _firestore;

  BuyerProfileRepositoryImpl(this._firestore);

  @override
  Future<void> createBuyerProfile(BuyerProfile buyerProfile) {
    return _firestore
        .collection('buyers')
        .doc(buyerProfile.id)
        .set(buyerProfile.toJson());
  }

  @override
  Future<BuyerProfile> getBuyerProfile(String id) async {
    final doc = await _firestore.collection('buyers').doc(id).get();
    return BuyerProfile.fromJson(doc.data()!);
  }

  @override
  Future<void> updateBuyerProfile(BuyerProfile buyerProfile) {
    return _firestore
        .collection('buyers')
        .doc(buyerProfile.id)
        .update(buyerProfile.toJson());
  }
}

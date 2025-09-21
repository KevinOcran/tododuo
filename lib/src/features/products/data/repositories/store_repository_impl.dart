import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/store.dart';
import '../../domain/repositories/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final FirebaseFirestore _firestore;

  StoreRepositoryImpl(this._firestore);

  @override
  Future<void> createStore(Store store) async {
    await _firestore.collection('stores').doc(store.id).set(store.toJson());
  }

  @override
  Future<Store?> getStoreBySellerId(String sellerId) async {
    final snapshot = await _firestore
        .collection('stores')
        .where('sellerId', isEqualTo: sellerId)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return Store.fromJson(snapshot.docs.first.data());
    } else {
      return null;
    }
  }

  @override
  Future<void> updateStore(Store store) async {
    await _firestore.collection('stores').doc(store.id).update(store.toJson());
  }
}

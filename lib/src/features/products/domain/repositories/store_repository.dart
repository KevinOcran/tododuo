import '../entities/store.dart';

abstract class StoreRepository {
  Future<void> createStore(Store store);
  Future<Store?> getStoreBySellerId(String sellerId);
  Future<void> updateStore(Store store);
}

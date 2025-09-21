import '../entities/buyer_profile.dart';

abstract class BuyerProfileRepository {
  Future<void> createBuyerProfile(BuyerProfile buyerProfile);
  Future<BuyerProfile> getBuyerProfile(String id);
  Future<void> updateBuyerProfile(BuyerProfile buyerProfile);
}

import '../entities/seller_profile.dart';

abstract class SellerProfileRepository {
  Future<void> createSellerProfile(SellerProfile sellerProfile);
  Future<SellerProfile> getSellerProfile(String id);
  Future<void> updateSellerProfile(SellerProfile sellerProfile);
}

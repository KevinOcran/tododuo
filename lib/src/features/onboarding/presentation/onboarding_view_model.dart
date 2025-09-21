import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/entities/buyer_profile.dart';
import '../domain/entities/dispatch_profile.dart';
import '../domain/entities/seller_profile.dart';
import '../domain/entities/user_profile.dart';
import '../data/repositories/buyer_profile_repository_impl.dart';
import '../data/repositories/dispatch_profile_repository_impl.dart';
import '../data/repositories/seller_profile_repository_impl.dart';
import '../data/repositories/user_profile_repository_impl.dart';
import '../domain/entities/user_role.dart';

// Providers for Firebase services
final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final onboardingViewModelProvider = ChangeNotifierProvider((ref) {
  final firestore = ref.watch(firestoreProvider);
  final auth = ref.watch(authProvider);
  return OnboardingViewModel(firestore, auth);
});

class OnboardingViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  late final UserProfileRepositoryImpl _userProfileRepository;
  late final BuyerProfileRepositoryImpl _buyerProfileRepository;
  late final SellerProfileRepositoryImpl _sellerProfileRepository;
  late final DispatchProfileRepositoryImpl _dispatchProfileRepository;

  UserRole? _selectedRole;
  UserRole? get selectedRole => _selectedRole;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Text editing controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final storeNameController = TextEditingController();
  final vehicleNumberPlateController = TextEditingController();

  OnboardingViewModel(this._firestore, this._auth) {
    _userProfileRepository = UserProfileRepositoryImpl(_firestore);
    _buyerProfileRepository = BuyerProfileRepositoryImpl(_firestore);
    _sellerProfileRepository = SellerProfileRepositoryImpl(_firestore);
    _dispatchProfileRepository = DispatchProfileRepositoryImpl(_firestore);
  }

  void selectRole(UserRole role) {
    _selectedRole = role;
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    if (_selectedRole == null) return;
    _setLoading(true);

    final user = _auth.currentUser;
    if (user == null) {
      _setLoading(false);
      // Handle error: user not logged in
      return;
    }

    try {
      final userProfile = UserProfile(
        id: user.uid,
        email: user.email!,
        role: _selectedRole.toString().split('.').last, // Convert enum to string
      );
      await _userProfileRepository.createUserProfile(userProfile);

      switch (_selectedRole!) {
        case UserRole.buyer:
          final buyerProfile = BuyerProfile(
            id: user.uid,
            name: nameController.text,
            phoneNumber: phoneController.text,
          );
          await _buyerProfileRepository.createBuyerProfile(buyerProfile);
          break;
        case UserRole.seller:
          final sellerProfile = SellerProfile(
            id: user.uid,
            storeName: storeNameController.text,
          );
          await _sellerProfileRepository.createSellerProfile(sellerProfile);
          break;
        case UserRole.dispatcher:
          final dispatchProfile = DispatchProfile(
            id: user.uid,
            vehicleNumberPlate: vehicleNumberPlateController.text,
          );
          await _dispatchProfileRepository.createDispatchProfile(
            dispatchProfile,
          );
          break;
      }
    } catch (e) {
      // Handle error
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    storeNameController.dispose();
    vehicleNumberPlateController.dispose();
    super.dispose();
  }
}

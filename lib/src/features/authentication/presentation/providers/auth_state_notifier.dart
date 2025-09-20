import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tododuo/src/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:tododuo/src/features/authentication/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(FirebaseAuth.instance);
});

final authStateChangesProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});

class AuthStateNotifier extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;

  AuthStateNotifier(this._authRepository) : super(const AsyncValue.data(null));

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  Future<void> signUp(String email, String password, String role) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _authRepository.createUserWithEmailAndPassword(
        email: email,
        password: password,
        role: role,
      );
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _authRepository.signOut();
    });
  }
}

final authStateNotifierProvider = StateNotifierProvider<AuthStateNotifier, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthStateNotifier(authRepository);
});

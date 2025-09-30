import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tododuo/src/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:tododuo/src/features/authentication/domain/repositories/auth_repository.dart';

// Create a Mock for FirebaseAuth
class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUser extends Mock implements User {}
class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late AuthRepository authRepository;
  late MockFirebaseAuth mockFirebaseAuth;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    authRepository = AuthRepositoryImpl(mockFirebaseAuth);
  });

  group('AuthRepositoryImpl', () {
    test('signInWithEmailAndPassword calls FirebaseAuth.signInWithEmailAndPassword', () async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => MockUserCredential());

      await authRepository.signInWithEmailAndPassword(
        email: 'test@example.com',
        password: 'password123',
      );

      verify(mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'test@example.com',
        password: 'password123',
      )).called(1);
    });

    test('signOut calls FirebaseAuth.signOut', () async {
      when(mockFirebaseAuth.signOut()).thenAnswer((_) async {});

      await authRepository.signOut();

      verify(mockFirebaseAuth.signOut()).called(1);
    });

    test('currentUser returns FirebaseAuth.currentUser', () {
      final mockUser = MockUser();
      when(mockFirebaseAuth.currentUser).thenReturn(mockUser);

      final result = authRepository.currentUser;

      expect(result, mockUser);
    });
  });
}

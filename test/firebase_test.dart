import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Firebase Authentication Mock Test', () {
    late MockUser mockUser;

    setUp(() {
      mockUser = MockUser(
        isAnonymous: false,
        email: 'bob@thebuilder.com',
        displayName: 'Bob Builder',
      );
    });

    test('Sign-In with Email and Password', () async {
      final auth = MockFirebaseAuth(mockUser: mockUser);
      const email = 'some email';
      const password = 'some password';
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = result.user!;

      expect(user, mockUser);
      expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
      expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));
    });

    test('Sign-Up Email and Password', () async {
      const email = 'some@email.com';
      const password = 'some!password';
      final auth = MockFirebaseAuth();
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = result.user!;

      expect(user.email, email);
      expect(user.isAnonymous, isFalse);

      final providerData = user.providerData;
      expect(providerData.length, 1);
      expect(providerData.first.providerId, 'password');
      expect(providerData.first.email, email);
      expect(providerData.first.uid, user.uid);

      expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
      expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));
    });
  });
}

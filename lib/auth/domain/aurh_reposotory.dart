// lib/auth/domain/auth_repository_interface.dart
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<User?> loginWithEmail(String email, String password);
  Future<User?> registerWithEmail(String email, String password);
  Future<User?> loginWithGoogle();

  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(FirebaseAuthException error) onError,
  });
  Future<User?> verifyOtp({
    required String verificationId,
    required String smsCode,
  });
  Future<void> logout();
  User? get currentUser;
}

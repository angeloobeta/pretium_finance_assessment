import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:pretium_finance_assessment/models/user.dart';
import 'package:pretium_finance_assessment/services/storage_service.dart';

class AuthService {
  final StorageService _storage = StorageService();
  User? _currentUser;

  User? get currentUser => _currentUser;

  // Auto login from saved credentials
  Future<User?> autoLogin() async {
    try {
      final userData = await _storage.getUser();
      if (userData != null) {
        _currentUser = userData;
        return _currentUser;
      }
      return null;
    } catch (e) {
      debugPrint('Auto login error: $e');
      return null;
    }
  }

  // Login with email and password
  Future<User?> login(String email, String password) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // For demo, accept any valid email format with password
      if (email.contains('@') && email.contains('.') && password.length >= 6) {
        final user = User(
          id: 'user_${DateTime.now().millisecondsSinceEpoch}',
          email: email,
          name: email.split('@').first,
        );

        _currentUser = user;
        await _storage.saveUser(user);
        return user;
      }

      return null;
    } catch (e) {
      debugPrint('Login error: $e');
      rethrow;
    }
  }

  // Register a new user
  Future<User?> register(String firstName, String lastName, String email,
      {String? password}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      final user = User(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        name: '$firstName $lastName',
      );

      _currentUser = user;
      await _storage.saveUser(user);
      return user;
    } catch (e) {
      debugPrint('Register error: $e');
      rethrow;
    }
  }

  // Send password reset code
  Future<bool> sendPasswordResetCode(String email) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      debugPrint('Send reset code error: $e');
      rethrow;
    }
  }

  // Reset password with code
  Future<bool> resetPassword(
      String email, String code, String newPassword) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      debugPrint('Reset password error: $e');
      rethrow;
    }
  }

  // Verify account with code
  Future<bool> verifyAccount(String email, String code) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      debugPrint('Verify account error: $e');
      rethrow;
    }
  }

  // Set up PIN
  Future<bool> setupPin(String pin) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      // Save PIN to secure storage
      await _storage.savePin(pin);
      return true;
    } catch (e) {
      debugPrint('Setup PIN error: $e');
      rethrow;
    }
  }

  // Logout user
  Future<void> logout() async {
    try {
      _currentUser = null;
      await _storage.clearUser();
    } catch (e) {
      debugPrint('Logout error: $e');
      rethrow;
    }
  }
}

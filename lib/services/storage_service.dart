import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:pretium_finance_assessment/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _userKey = 'user_data';
  static const String _pinKey = 'user_pin';

  // Save user to storage
  Future<void> saveUser(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = jsonEncode(user.toJson());
      await prefs.setString(_userKey, userData);
    } catch (e) {
      debugPrint('Save user error: $e');
      rethrow;
    }
  }

  // Get user from storage
  Future<User?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString(_userKey);

      if (userData != null) {
        return User.fromJson(jsonDecode(userData));
      }
      return null;
    } catch (e) {
      debugPrint('Get user error: $e');
      return null;
    }
  }

  // Clear user from storage
  Future<void> clearUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userKey);
    } catch (e) {
      debugPrint('Clear user error: $e');
      rethrow;
    }
  }

  // Save PIN to storage (in a real app, use secure storage)
  Future<void> savePin(String pin) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_pinKey, pin);
    } catch (e) {
      debugPrint('Save PIN error: $e');
      rethrow;
    }
  }

  // Get PIN from storage
  Future<String?> getPin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_pinKey);
    } catch (e) {
      debugPrint('Get PIN error: $e');
      return null;
    }
  }
}

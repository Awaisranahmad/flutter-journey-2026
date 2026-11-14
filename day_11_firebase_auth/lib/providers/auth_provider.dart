import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _service = AuthService();
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get user => _service.currentUser;
  Stream<User?> get authState => _service.authStateChanges;

  // ---------- SIGN UP ----------
  Future<bool> signUp(String email, String password) async {
    _setLoading(true);
    try {
      await _service.signUp(email, password);
      _setLoading(false);
      return true;
    } catch (e) {
      _setError(e.toString());
      _setLoading(false);
      return false;
    }
  }

  // ---------- LOG IN ----------
  Future<bool> login(String email, String password) async {
    _errorMessage = null;
    _setLoading(true);
    try {
      await _service.login(email, password);
      _setLoading(false);
      return true;
    } catch (e) {
      _setError(e.toString());
      _setLoading(false);
      return false;
    }
  }

  // ---------- LOG OUT ----------
  Future<void> logout() async {
    await _service.logout();
    notifyListeners();
  }

  // Helpers
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}

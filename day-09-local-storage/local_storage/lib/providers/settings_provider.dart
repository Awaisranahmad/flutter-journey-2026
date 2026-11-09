import 'package:flutter/material.dart';
import '../models/user_settings.dart';
import '../services/storage_service.dart';

class SettingsProvider extends ChangeNotifier {
  final StorageService _storage = StorageService();

  UserSettings _settings = const UserSettings();
  bool _isLoading = true;

  // Getters
  UserSettings get settings => _settings;
  bool get isLoading => _isLoading;

  // ---------- INIT: Load data from storage ----------
  Future<void> loadSettings() async {
    _isLoading = true;
    notifyListeners();

    final name = await _storage.getUserName();
    final isDark = await _storage.getDarkMode();
    final lang = await _storage.getLanguage();

    _settings = UserSettings(
      userName: name,
      isDarkMode: isDark,
      language: lang,
    );

    _isLoading = false;
    notifyListeners();
  }

  // ---------- UPDATE & SAVE: Dark Mode ----------
  Future<void> toggleDarkMode(bool value) async {
    _settings = _settings.copyWith(isDarkMode: value);
    notifyListeners(); // UI update karo
    await _storage.saveDarkMode(value); // Phone memory mein save karo
  }

  // ---------- UPDATE & SAVE: User Name ----------
  Future<void> updateUserName(String name) async {
    if (name.trim().isEmpty) return;
    _settings = _settings.copyWith(userName: name.trim());
    notifyListeners();
    await _storage.saveUserName(name.trim());
  }

  // ---------- UPDATE & SAVE: Language ----------
  Future<void> updateLanguage(String lang) async {
    _settings = _settings.copyWith(language: lang);
    notifyListeners();
    await _storage.saveLanguage(lang);
  }
}

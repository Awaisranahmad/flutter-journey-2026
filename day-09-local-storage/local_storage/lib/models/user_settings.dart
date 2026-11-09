class UserSettings {
  final String _userName;
  final bool _isDarkMode;
  final String _language;

  const UserSettings({
    this._userName = 'Guest',
    this._isDarkMode = false,
    this._language = 'English',
  });

  // Getters
  String get userName => _userName;
  bool get isDarkMode => _isDarkMode;
  String get language => _language;

  // copyWith Pattern (Naya object banane ke liye)
  //Instead of destroying the existing state object when updating app settings (such as enabling Dark Mode),
  //we create a new instance using copyWith. This allows us to modify only the specific fields
  //that changed while preserving the rest of the original state.
  UserSettings copyWith({
    String? userName,
    bool? isDarkMode,
    String? language,
  }) {
    return UserSettings(
      userName: userName ?? _userName,
      isDarkMode: isDarkMode ?? _isDarkMode,
      language: language ?? _language,
    );
  }
}

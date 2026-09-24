class User {
  final int _id;
  final String _name;
  final String _username;
  final String _email;
  final String _phone;
  final String _website;
  final String _company;
  final String _city;
  const User({
    required this._city,
    required this._company,
    required this._email,
    required this._id,
    required this._name,
    required this._phone,
    required this._username,
    required this._website,
  });

  int get id => _id;
  String get name => _name;
  String get username => _username;
  String get email => _email;
  String get phone => _phone;
  String get website => _website;
  String get city => _city;
  String get company => _company;

  String get initial =>
      _name.trim().isNotEmpty ? _name.trim()[0].toUpperCase() : '?';
  factory User.fromJson(Map<String, dynamic> json) {
    // Nested objects ko safely access karo
    final address = json['address'] as Map<String, dynamic>?;
    final company = json['company'] as Map<String, dynamic>?;

    return User(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      website: json['website'] as String? ?? '',
      city: address?['city'] as String? ?? 'N/A',
      company: company?['name'] as String? ?? 'N/A',
    );
  }
}

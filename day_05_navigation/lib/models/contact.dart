class Contact {
  final String name;
  final String email;
  final String city;

  final String phone;

  Contact({
    required this.city,
    required this.email,
    required this.name,
    required this.phone,
  });
  String get initial {
    if (name.isEmpty) return '?';
    return name[0].toUpperCase();
  }
}

class Post {
  final int _id;
  final String _title;
  final String _body;

  const Post({this._id = 0, required this._title, required this._body});
  // Getters
  int get id => _id;
  String get title => _title;
  String get body => _body;

  // JSON -> Dart Object (Get ke liye)
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
    );
  }
  // dart object   json (post ke lye)
  Map<String, dynamic> toJson() {
    return {'title': _title, 'body': _body};
  }
}

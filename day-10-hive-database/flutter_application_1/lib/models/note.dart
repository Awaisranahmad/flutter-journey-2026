class Note {
  final String _id;
  final String _title;
  final String _content;
  final String _date;

  const Note({
    required this._id,
    required this._title,
    required this._content,
    required this._date,
  });

  // Getters
  String get id => _id;
  String get title => _title;
  String get content => _content;
  String get date => _date;

  // Map -> Note Object fetch from hive (Hive se nikalte waqt)
  factory Note.fromMap(Map<dynamic, dynamic> map) {
    return Note(
      id: map['id'] as String? ?? '',
      title: map['title'] as String? ?? 'No Title',
      content: map['content'] as String? ?? '',
      date: map['date'] as String? ?? '',
    );
  }

  // Note Object -> Map save in the hive (Hive mein save karte waqt)
  Map<String, dynamic> toMap() {
    return {'id': _id, 'title': _title, 'content': _content, 'date': _date};
  }
}

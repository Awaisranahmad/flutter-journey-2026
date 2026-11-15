import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String _id;
  final String _title;
  final bool _isDone;
  final DateTime _createdAt;

  const Task({
    required this._id,
    required this._title,
    this._isDone = false,
    required this._createdAt,
  });

  String get id => _id;
  String get title => _title;
  bool get isDone => _isDone;
  DateTime get createdAt => _createdAt;

  // Firestore Document -> Task Object
  factory Task.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      title: data['title'] as String? ?? 'No Title',
      isDone: data['isDone'] as bool? ?? false,
      // Firestore Timestamp ko DateTime mein convert karna
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
  Task copyWith({String? title, bool? isDone, DateTime? createdAt}) {
    return Task(
      id: _id,
      title: title ?? _title,
      isDone: isDone ?? _isDone,
      createdAt: createdAt ?? _createdAt,
    );
  }

  // Task Object -> Firestore Map
  Map<String, dynamic> toMap() {
    return {
      'title': _title,
      'isDone': _isDone,
      'createdAt': FieldValue.serverTimestamp(), // Server ka time use karo
    };
  }
}

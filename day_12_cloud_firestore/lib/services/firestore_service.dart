import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/task.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _userId => _auth.currentUser?.uid ?? 'guest';

  // ---------- COLLECTION REFERENCE GETTER ----------
  CollectionReference get _tasksRef =>
      _db.collection('users').doc(_userId).collection('tasks');

  // ---------- READ (Real-time Stream) ----------
  Stream<List<Task>> getTasks() {
    return _tasksRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList(),
        );
  }

  // ---------- CREATE ----------
  Future<void> addTask(String title) async {
    final newTask = Task(id: '', title: title, createdAt: DateTime.now());

    await _tasksRef.add(newTask.toMap());
  }

  // ---------- UPDATE ----------
  Future<void> toggleTaskStatus(Task task) async {
    await _tasksRef.doc(task.id).update({'isDone': !task.isDone});
  }

  // ---------- DELETE ----------
  Future<void> deleteTask(String id) async {
    await _tasksRef.doc(id).delete();
  }
}

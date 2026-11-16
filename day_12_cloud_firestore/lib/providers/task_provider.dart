import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/firestore_service.dart';

class TaskProvider extends ChangeNotifier {
  final FirestoreService _service = FirestoreService();

  Stream<List<Task>> get taskStream => _service.getTasks();
  // -------------------ADD---------------------
  Future<void> addTask(String title) async {
    if (title.trim().isEmpty) return;
    await _service.addTask(title.trim());
  }

  //---------------- Toggle----------
  Future<void> toggleTask(Task task) async {
    await _service.toggleTaskStatus(task);
  }

  //-------------------Delete----------------
  Future<void> deleteTask(String id) async {
    await _service.deleteTask(id);
  }
}

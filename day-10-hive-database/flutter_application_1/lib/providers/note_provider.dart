import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/notes_service.dart';

class NoteProvider extends ChangeNotifier {
  final NoteService _service = NoteService();
  List<Note> _notes = [];
  bool _isLoading = true;

  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;

  // ---------- LOAD DATA ----------
  Future<void> loadNotes() async {
    _isLoading = true;
    notifyListeners();

    _notes = await _service.getAllNotes();

    _isLoading = false;
    notifyListeners();
  }

  // ---------- ADD / UPDATE ----------
  Future<void> saveNote(Note note) async {
    await _service.saveNote(note);
    await loadNotes(); // Data refresh karo
  }

  // ---------- DELETE ----------
  Future<void> deleteNote(String id) async {
    await _service.deleteNote(id);
    await loadNotes(); // Data refresh karo
  }
}

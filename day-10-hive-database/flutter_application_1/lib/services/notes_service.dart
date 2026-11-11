import 'package:hive/hive.dart';
import '../models/note.dart';

class NoteService {
  static const String boxName = 'notesBox';

  // Get the Hive Box
  Future<Box> get _box async => await Hive.openBox(boxName);

  // ---------- CREATE / UPDATE ----------
  Future<void> saveNote(Note note) async {
    final box = await _box;
    // Hum 'note.id' ko as a Key use kar rahe hain.
    // Agar id same hai toh update ho jayega, nayi hai toh add.
    await box.put(note.id, note.toMap());
  }

  // ---------- READ ALL ----------
  Future<List<Note>> getAllNotes() async {
    final box = await _box;
    final List<Note> notes = [];

    for (var i = 0; i < box.length; i++) {
      final key = box.keyAt(i);
      final value = box.get(key);
      if (value != null) {
        notes.add(Note.fromMap(value as Map));
      }
    }

    // Latest notes pehle dikhane ke liye sort karo (id reverse)
    notes.sort((a, b) => b.id.compareTo(a.id));
    return notes;
  }

  // ---------- DELETE ----------
  Future<void> deleteNote(String id) async {
    final box = await _box;
    await box.delete(id);
  }
}

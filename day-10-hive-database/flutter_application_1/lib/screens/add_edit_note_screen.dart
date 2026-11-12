import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/note_provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? existingNote; // Agar null hai toh naya note banega

  const AddEditNoteScreen({super.key, this.existingNote});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  bool get isEditing => widget.existingNote != null;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.existingNote?.title ?? '',
    );
    _contentController = TextEditingController(
      text: widget.existingNote?.content ?? '',
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveNote() {
    if (!_formKey.currentState!.validate()) return;

    final now = DateTime.now();
    final formattedDate =
        '${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute.toString().padLeft(2, '0')}';

    final note = Note(
      // Agar edit ho raha hai toh purani ID rakho, warna nayi unique ID banao
      id: isEditing
          ? widget.existingNote!.id
          : now.millisecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      content: _contentController.text.trim(),
      date: formattedDate,
    );

    context.read<NoteProvider>().saveNote(note);
    Navigator.pop(context); // Wapas list screen pe jao
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Note' : 'New Note'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _saveNote),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'Note Title...',
                  border: InputBorder.none,
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Title required'
                    : null,
              ),
              const Divider(),
              Expanded(
                child: TextFormField(
                  controller: _contentController,
                  maxLines: null, // Jitna likho utna bada ho
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    hintText: 'Start writing...',
                    border: InputBorder.none,
                  ),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Content required'
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

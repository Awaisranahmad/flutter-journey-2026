import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // ---------- UPLOAD IMAGE ----------
  Future<String?> uploadProfileImage(File imageFile) async {
    try {
      // Unique file name banayein (timestamp use karke)
      final String fileName =
          'profile_${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Storage Reference
      final Reference ref = _storage
          .ref()
          .child('profile_pics')
          .child(fileName);

      // Upload Task
      final UploadTask uploadTask = ref.putFile(imageFile);

      // Upload complete hone ka wait karein
      final TaskSnapshot snapshot = await uploadTask;

      // Download URL hasil karein
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      throw ('Upload Error: $e');
      // return null;
    }
  }
}

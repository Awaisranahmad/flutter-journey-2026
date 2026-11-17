import 'dart:io';
import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class ProfileProvider extends ChangeNotifier {
  final StorageService _service = StorageService();

  bool _isUploading = false;
  String? _imageUrl;
  String? _errorMessage;

  bool get isUploading => _isUploading;
  String? get imageUrl => _imageUrl;
  String? get errorMessage => _errorMessage;

  Future<void> uploadImage(File file) async {
    _isUploading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final url = await _service.uploadProfileImage(file);
      if (url != null) {
        _imageUrl = url;
      }
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      _isUploading = false;
      notifyListeners();
    }
  }
}

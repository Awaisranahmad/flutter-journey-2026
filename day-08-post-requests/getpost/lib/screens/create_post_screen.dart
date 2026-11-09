import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/custom_text_field.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _apiService = ApiService();

  bool _isLoading = false;

  Future<void> _submitPost() async {
    // 1. Form validation
    if (!_formKey.currentState!.validate()) return;

    // 2. UI loading start
    setState(() => _isLoading = true);

    try {
      // 3. API Call
      final newPost = await _apiService.createPost(
        _titleController.text.trim(),
        _bodyController.text.trim(),
      );

      // 4. Success -> Show Dialog
      if (mounted) {
        _showSuccessDialog(newPost.id);
        // Form clear karo
        _titleController.clear();
        _bodyController.clear();
      }
    } on ApiException catch (e) {
      // 5. Error -> Show Snackbar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message), backgroundColor: Colors.red),
        );
      }
    } finally {
      // 6. Loading stop
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSuccessDialog(int postId) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Success! 🎉'),
        content: Text('Post created with ID: $postId'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext); // Dialog band
              Navigator.pop(context, true); // Screen se wapas, result 'true'
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: _titleController,
                label: 'Title',
                hint: 'Enter post title...',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Title is required';
                  }
                  if (value.trim().length < 3) {
                    return 'Title must be at least 3 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _bodyController,
                label: 'Body',
                hint: 'Write your post here...',
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Body is required';
                  }
                  if (value.trim().length < 10) {
                    return 'Body must be at least 10 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitPost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Submit Post',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

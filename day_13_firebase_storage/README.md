# Day 13: Firebase Storage (Image Upload)

## 📚 What I Learned
- Setting up Firebase Storage in a Flutter app
- Picking images from Gallery/Camera using `image_picker`
- Uploading files to Firebase Cloud Storage
- Retrieving the download URL of uploaded images
- Managing upload progress and loading states
- Securing API keys using `.gitignore`

## 🛠 Project: Profile Picture Uploader
- Pick an image from the device
- Upload it to Firebase Storage
- Fetch and display the uploaded image via URL
- Loading indicator during upload

## 🎯 Challenges Faced
1. Requesting storage permissions on Android/iOS.
2. Converting `XFile` to `File` for uploading.
3. Keeping `firebase_options.dart` out of Git to pass GitHub Secret Scanning.

## 🚀 Next Steps
- Day 14: Firebase Cloud Messaging (Push Notifications)
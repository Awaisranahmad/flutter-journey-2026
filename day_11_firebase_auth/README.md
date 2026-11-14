# Day 11: Firebase Authentication

## 📚 What I Learned
- Setting up a Firebase project and connecting it to a Flutter app.
- Using `flutterfire configure` CLI to generate `firebase_options.dart`.
- Initializing Firebase in `main()` using `WidgetsFlutterBinding.ensureInitialized()`.
- Email/Password Authentication (Sign Up, Login, Logout) using `firebase_auth`.
- Handling `FirebaseAuthException` to show user-friendly error messages.
- Managing Auth State (Auto-login) using `StreamBuilder` and `authStateChanges`.
- Combining Firebase Auth with `Provider` for clean state management.

## 🛠 Project: Firebase Auth App
- Signup screen with email & password validation.
- Login screen with loading states and error feedback.
- Protected Home screen that only shows if the user is logged in.
- Logout functionality.
- **Auto-login:** Data persists across app restarts (User stays logged in).

## 🎯 Challenges Faced & Solutions
1. **Windows C++ Build Error (`LNK2019`):** Resolved by updating Visual Studio C++ build tools and running `flutter clean`.
2. **White Screen on Launch:** Caused by missing `firebase_options.dart`. Fixed by running `flutterfire configure` and selecting the Windows/Web platforms.
3. **`flutterfire` command not recognized:** Fixed by adding `%LOCALAPPDATA%\Pub\Cache\bin` to the System Environment Variables (PATH).
4. **400 Bad Request on Signup:** Fixed by ensuring the email was in a valid format (e.g., `name@domain.com`) and enabling the Email/Password provider in the Firebase Console.
5. **State Management:** Used `AuthProvider` (`ChangeNotifier`) to separate UI from Firebase logic.

## 🚀 Next Steps
- Day 12: Cloud Firestore (Real-time Database)
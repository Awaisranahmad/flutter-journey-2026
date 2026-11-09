# Day 09: Local Storage with SharedPreferences

## 📚 What I Learned
- Storing simple data (String, bool, int) locally
- `SharedPreferences` package integration
- Persisting user preferences across app restarts
- Integrating Provider with Local Storage
- Reading and Writing data asynchronously
- Dynamic Theme switching based on saved state

## 🛠 Project: Settings App
- Dark Mode toggle (saved permanently)
- User Name input (saved permanently)
- Language selection (Dropdown)
- Data survives app restart
- Dynamic UI theming (Light/Dark mode)

## 🎯 Challenges Faced
1. `WidgetsFlutterBinding.ensureInitialized()` in `main()`
2. Syncing `ChangeNotifier` state with `SharedPreferences`
3. Managing async data loading on app startup
4. Applying the theme dynamically to `MaterialApp`

## 🚀 Next Steps
- Day 10: Local Database (SQLite/Hive) for complex data
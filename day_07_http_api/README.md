# Day 07: HTTP Requests & REST API Integration

## 📚 What I Learned
- Making HTTP requests with the `http` package
- `GET`, `POST` requests in Flutter
- Parsing JSON responses into Dart models
- `FutureBuilder` for async data
- Loading, success, and error states
- Handling network timeouts and exceptions
- `factory` constructors for JSON deserialization
- Null safety with API data (`?.`, `??`)
- Pull-to-refresh with `RefreshIndicator`

## 🛠 Project: Users Directory App
- Fetch users from JSONPlaceholder API
- Display in a clean list with avatars
- Tap on user → Detail screen with full info
- Pull-to-refresh to reload data
- Search filter for users
- Loading spinner while fetching
- Error view with retry button

## 🎯 Challenges Faced
1. Understanding `async`/`await` with `FutureBuilder`
2. Parsing nested JSON safely
3. Handling network failures gracefully
4. Type conversion with null safety
5. State management with async operations

## 🚀 Next Steps
- Day 08: POST requests + sending data to server
- Day 09: Local storage (SharedPreferences, SQLite)
# Day 08: HTTP POST Requests

## 📚 What I Learned
- Sending data to a server using `http.post`
- Encoding Dart objects to JSON with `jsonEncode`
- Setting HTTP Headers (`Content-Type: application/json`)
- Handling form validation before API calls
- Managing loading states during form submission
- Showing success/error feedback to the user
- Updating local state after a successful POST

## 🛠 Project: Create Post App
- Form with Title and Body fields
- Client-side validation
- Submit to JSONPlaceholder API
- Loading spinner on the button during submission
- Success dialog with the returned ID
- Error handling (network failure)

## 🎯 Challenges Faced
1. Converting Dart Object to JSON using `toJson()`
2. `jsonEncode` and parsing the response back
3. Disabling the button while the API call is in progress
4. Handling navigation context after async gaps

## 🚀 Next Steps
- Day 09: Local Storage (SharedPreferences)
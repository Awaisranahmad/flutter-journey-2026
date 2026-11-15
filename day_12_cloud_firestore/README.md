# Day 12: Cloud Firestore (Real-time Database)

## 📚 What I Learned
- Setting up Cloud Firestore in a Flutter app
- NoSQL Document/Collection structure
- Adding, updating, and deleting documents
- **Real-time updates** using `Stream` and `StreamBuilder`
- Converting Firestore `Timestamp` to `DateTime`
- Filtering data by authenticated `userId`

## 🛠 Project: Cloud To-Do App
- User-specific tasks (Data is isolated per user)
- Add new tasks to Cloud
- Mark tasks as completed/incomplete
- Delete tasks (swipe to delete)
- Real-time UI updates (No manual refresh needed)

## 🎯 Challenges Faced
1. Mapping Firestore `Timestamp` to Dart `DateTime`
2. Setting up Firestore Security Rules (Test mode for now)
3. Using `StreamBuilder` instead of `FutureBuilder` for real-time data
4. Handling `null` snapshots while data is loading

## 🚀 Next Steps
- Day 13: Firebase Storage (Image Upload)
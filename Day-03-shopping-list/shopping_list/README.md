# Day 03: Lists + TextField + ListView

## 📚 What I Learned
- Creating and using `List<String>`
- Rendering dynamic lists with `ListView.builder`
- Taking user input with `TextEditingController`
- Updating list state using `setState`
- Input validation and showing `SnackBar` messages

## 🛠 Project: Shopping List App
- Displays a list of items (Apple, Banana, Mango).
- Add new items via a TextField.
- Warns the user when a duplicate item is added.
- Tap on an item to delete it.
- Displays total items count in the AppBar.

## 🎯 Challenges Faced
1. `ListView` must be wrapped in `Expanded` inside a `Column`, otherwise the app crashes.
2. Controllers must be disposed in `dispose()` to prevent memory leaks.
3. Using `.trim()` to avoid extra whitespace in user input.

## 🚀 Next Steps
- Day 04: OOP (Classes and Objects)
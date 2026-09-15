# Day 06: Provider State Management

## 📚 What I Learned
- What is Provider and why it's needed
- `ChangeNotifier` and `notifyListeners()`
- `ChangeNotifierProvider` setup at app root
- `Consumer` widget for reactive rebuilds
- `context.read()` vs `context.watch()` vs `Consumer`
- Sharing state across multiple screens
- Immutable models with `copyWith()` pattern
- Unmodifiable lists for data safety

## 🛠 Project: Shopping Cart App
- Product list screen with 5 products
- Add to cart (multiple times = quantity++)
- Cart screen showing all items with quantity controls
- Real-time total calculation
- Remove items / clear cart
- Cart badge showing item count

## 🎯 Challenges Faced
1. Understanding when to use `read` vs `watch`
2. Making cart items immutable with `copyWith`
3. Preventing direct list modification with `List.unmodifiable`
4. Efficient rebuilding with `Consumer` (only rebuild what's needed)

## 🚀 Next Steps
- Day 07: HTTP requests + REST API integration
- Day 08: Local storage (SharedPreferences, SQLite)
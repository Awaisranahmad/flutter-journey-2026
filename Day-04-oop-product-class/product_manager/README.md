# Day 04: OOP + Classes (Product Manager)

## 📚 What I Learned
- What Classes and Objects are
- Constructors with `required` and default values
- Creating a calculated property with a getter (`totalPrice`)
- Storing objects in a list (`List<Product>`)
- Splitting code into multiple files (`models/product.dart`)
- The difference between `final` and non-final properties

## 🛠 Project: Product Manager App
- Product list with name, price, and quantity.
- Real-time grand total calculation in the AppBar.
- Increase/decrease quantity with bounds checking (min 1).
- Add new product with input validation.

## 🎯 Challenges Faced
1. `final` vs non-final properties — `name` and `price` don't change, `quantity` does.
2. `ListView` must be wrapped in `Expanded` inside a `Column`, otherwise the app crashes.
3. Safe number parsing with `double.tryParse()` to handle invalid input.

## 🚀 Next Steps
- Day 05: Navigation (multi-screen app)>>>
- Day 06: Provider state management
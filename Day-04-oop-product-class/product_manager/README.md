# Day 04: Complete OOP (Product Manager)

## 📚 What I Learned
### OOP Fundamentals
- **Class & Object:** Blueprint vs actual instance
- **Constructor:** `required`, default values, named parameters
- **Getter:** Calculated properties like `totalPrice`

### Four Pillars of OOP
1. **Encapsulation:** Private fields (`_quantity`), access only via methods
2. **Inheritance:** `ElectronicProduct`, `FoodProduct` extend `Product`
3. **Polymorphism:** Different classes, same method name (`totalPrice`)
4. **Abstraction:** `abstract class Product` with abstract method `getDescription()`

### Bonus
- **Mixins:** `Discountable` reusable behavior
- **File splitting:** `models/` folder for clean architecture

## 🛠 Project: Product Manager App
- Products with name, price, quantity (encapsulated)
- Two types: Electronic (+5% tax) and Food (−2% discount)
- Grand total in AppBar, updates in real-time
- Quantity controls with validation
- Description method (abstract) per product
- Discount mixin applied to food items

## 🎯 Challenges Faced
1. `abstract class` cannot be instantiated directly
2. `mixin` vs `abstract class` — when to use which
3. Calling parent's getter with `super.totalPrice`
4. `@override` keyword required for polymorphic behavior

## 🚀 Next Steps
- Day 05: Navigation (multi-screen app)
- Day 06: Provider state management
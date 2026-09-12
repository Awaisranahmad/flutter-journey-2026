mixin Discountable {
  double discountPercent = 0;
  void applyDiscount(double percent) {
    if (percent >= 0 && percent <= 100) {
      discountPercent = percent;
    }
  }

  double applyTo(double amount) {
    return amount * (1 - discountPercent / 100);
  }
}

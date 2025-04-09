class TPricingCalculator {
  static double calculatorTotalPrice(double productPrice, int quantity) {
    // double shippingCost = getShippingCost(location);

    return productPrice * quantity;
  }

  static double getShippingCost(double productPrice , double quantity) {
    if (quantity < 5){
      return productPrice * 0.1;
    } else if (quantity < 10){
      return productPrice * 0.05;
    } else {
      return 0;
    }
  }


}

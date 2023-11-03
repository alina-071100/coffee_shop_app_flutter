import 'package:coffee_shop_app/models/coffee_models.dart';
import 'package:flutter/foundation.dart';

class MenuPageProvider with ChangeNotifier {
  List<CoffeeModel> addCoffee = [];
  List<CoffeeModel> addTestCoffee = [];
  int count = 0;
  double price = 0;

  void addItemBag(CoffeeModel model) {
    var isExist = addCoffee.where((element) => element.id == model.id);
    if (isExist.isEmpty) {
      count = 1;
      model.count = count;
      addCoffee.add(model);
    } else {
      count = isExist.first.count ?? 0;
      price = isExist.first.price ?? 0;
      count += 1;
      double priceItems = 0;
      priceItems = price * count;
      isExist.first.count = count;
      isExist.first.priceItems = priceItems;
    }
    total();
    notifyListeners();
  }

  void minusItem(CoffeeModel model) {
    count = model.count ?? 0;
    if (count > 1) {
      double itemsPrice = model.priceItems ?? 0;
      double temp = itemsPrice - price;
      count--;
      model.count = count;

      model.priceItems = temp;
      total();
    }

    notifyListeners();
  }

  void plusItem(CoffeeModel model) {
    count = model.count ?? 0;
    price = model.price;
    double itemsPrice = model.priceItems ?? 0;
    double temp = itemsPrice + price;
    count++;
    model.count = count;
    model.priceItems = temp;
    total();

    notifyListeners();
  }

  void deletedItem(CoffeeModel model) {
    model.count = 0;
    addCoffee.remove(model);
    total();
    notifyListeners();
  }

  double total() {
    double total = 0;
    addCoffee.forEach((element) {
      total += element.priceItems ?? 0;
    });
    return total;
  }

  List<CoffeeModel> get shoppingCart => addCoffee;

    double get deliveryCharge => 1.0;
      double get coffeeSubTotal => total();

  double get coffeeTotal => coffeeSubTotal + deliveryCharge;

}

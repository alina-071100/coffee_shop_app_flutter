import 'package:coffee_shop_app/data/cakes_data.dart';
import 'package:coffee_shop_app/data/chessecakes_data.dart';
import 'package:coffee_shop_app/data/coffee_data.dart';
import 'package:coffee_shop_app/models/coffee_models.dart';
import 'package:flutter/foundation.dart';

class MenuPageProvider with ChangeNotifier {
  List<CoffeeModel> addCoffee = [];
  List<CoffeeModel> addTestCoffee = List.from(coffeeList);
  List<CoffeeModel> addTestCake = List.from(cakeList);
  List<CoffeeModel> addTestChees = List.from(cheescakeList);

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

  void searchCoffee(String value) {
    print(value);
    final temp = coffeeList.where((element) {
      print(value);
      // final name = element.name.toLowerCase();

      final coffeWithname = element.coffeeWith.toLowerCase();
      final val = value.toLowerCase();
      return coffeWithname.contains(value);
      // return name.contains(value);
    }).toList();
    addTestCoffee = temp;
    notifyListeners();
  }

  void searchCake(String value) {
    print(value);
    final temptwo = cakeList.where((element) {
      print(value);

      final cakeName = element.coffeeWith.toLowerCase();
      final val = value.toLowerCase();
      return cakeName.contains(value);
    }).toList();
    addTestCake = temptwo;
    notifyListeners();
  }

  void searchChees(String value) {
    print(value);
    final tempthree = cheescakeList.where((element) {
      print(value);
      final name = element.name.toLowerCase();
      final val = value.toLowerCase();
      return name.contains(value);
    }).toList();
    addTestChees = tempthree;
    notifyListeners();
  }
}

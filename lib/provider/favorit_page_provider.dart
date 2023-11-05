import 'package:coffee_shop_app/models/coffee_models.dart';
import 'package:flutter/material.dart';

class FavouritListProvider with ChangeNotifier {
  List<CoffeeModel> favouritList = [];

  void addorRemove(CoffeeModel coffeitem) {
    if (favouritList.contains(coffeitem)) {
      favouritList.remove(coffeitem);

      coffeitem.isFavorite = false;
    } else {
      favouritList.add(coffeitem);
      coffeitem.isFavorite = true;
    }
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}

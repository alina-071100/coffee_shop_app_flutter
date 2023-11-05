class CoffeeModel {
  final String image;
  final String id;
  final String name;
  final String coffeeWith;
  double price;
  double? priceItems;
  final double rate;
  final String description;
  int? count = 0;
  final bool isAvailable;
  bool? isFavorite;

  CoffeeModel({
    required this.id,
    required this.image,
    required this.name,
    required this.coffeeWith,
    required this.price,
    required this.rate,
    this.priceItems = 0,
    required this.description,
    this.count,
    required this.isAvailable,
    this.isFavorite,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'image': image,
  //     'name': name,
  //     'coffeeWith': coffeeWith,
  //     'price': price,
  //     'rate': rate,
  //     'description': description,
  //   };
  // }

  // factory CoffeeModel.fromMap(Map<String, dynamic> map) {
  //   return CoffeeModel(
  //     image: map['image'] ?? '',
  //     name: map['name'] ?? '',
  //     coffeeWith: map['coffeeWith'] ?? '',
  //     price: map['price'] ?? '',
  //     rate: map['rate'] ?? '',
  //     description: map['description']?.toDouble() ?? 0.0,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory CoffeeModel.fromJson(String source) =>
  //     CoffeeModel.fromMap(json.decode(source));
}

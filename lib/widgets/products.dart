import 'package:get/get.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final details;
  final image;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      this.details,
      this.image});

  @override
  String toString() {
    return 'Product(id:$id,name:$name,price:$price)';
  }
}

class CartItem {
  final Product product;
  RxInt quantity;

  CartItem({required this.product, int quantity = 1}) : quantity = quantity.obs;

  @override
  String toString() {
    return '${product.name} x$quantity';
  }
}

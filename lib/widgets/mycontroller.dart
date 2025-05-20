import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'products.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    print('adding to cart: $product');
    cartItems.add(product);
  }

  void removeFromCart() {
    if (cartItems.length <= 0) {
      Get.snackbar(
        'Note',
        'Can not be less than 0',
        icon: Icon(Icons.info),
        barBlur: 100,
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
    } else {
      print('removing from cart');
      cartItems.removeLast();
    }
  }

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  int get itemCount => cartItems.length;
}

import 'package:eatup/widgets/widg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'products.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addToCart(Product product, BuildContext ctx) {
    int index =
        cartItems.indexWhere((element) => element.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity.value++;
      showSuccessToast(context: ctx, message: 'Cart has been updated');
      // cartItems.refresh();
    } else {
      cartItems.add(CartItem(product: product));
      showSuccessToast(context: ctx, message: 'Cart has been updated');
    }
  }

  void deleteFromCart(Product product, BuildContext ctx) {
    int index =
        cartItems.indexWhere((element) => element.product.id == product.id);

    cartItems.removeAt(index);
    showSuccessToast(context: ctx, message: 'Cart has been updated');
  }

  void removeFromCart(Product product, BuildContext ctx) {
    int index =
        cartItems.indexWhere((element) => element.product.id == product.id);

    if (cartItems[index].quantity.value == 1) {
      cartItems.removeAt(index);
      showSuccessToast(context: ctx, message: 'Cart has been updated');
    } else {
      int index =
          cartItems.indexWhere((element) => element.product.id == product.id);
      if (index != -1) {
        cartItems[index].quantity.value--;
        showSuccessToast(context: ctx, message: 'Cart has been updated');

        // cartItems.refresh();
      } else {
        cartItems.remove(CartItem(product: product));
        showSuccessToast(context: ctx, message: 'Cart has been updated');
      }
    }
  }

  get productcount {}

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.product.price);

  int get itemCount => cartItems.length;

  int getProductQuantity(int productId) {
    final item = cartItems.firstWhereOrNull((e) => e.product.id == productId);
    return item?.quantity.value ?? 0;
  }
}

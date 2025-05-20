class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  @override
  String toString() {
    return 'Product(id:$id,name:$name,price:$price)';
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  @override
  String toString() {
    return '${product.name} x$quantity';
  }
}

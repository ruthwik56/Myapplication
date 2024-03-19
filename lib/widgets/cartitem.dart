import 'package:flutter/cupertino.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem({required String name, required double price, required int quantity}) {
    // Check if the item already exists in the cart
    int existingIndex = _items.indexWhere((items) => items.name == name);

    if (existingIndex != -1) {
      // Item already exists in the cart, update its quantity
      _items[existingIndex].quantity += quantity;
    } else {
      // Item doesn't exist in the cart, add it
      _items.add(CartItem(name: name, price: price, quantity: quantity));
    }

    notifyListeners();
  }
  double get totalAmount {
    double total = 0;
    for (var item in _items) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
  void incrementQuantity(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }
}
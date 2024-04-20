// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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

    if (existingIndex >=0) {
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
  //increasing quantity
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
  String _formatPrice(double price){
    return "\₹${price.toStringAsFixed(2)}";
  }
  String formatitems(List<CartItem> _items){
    return _items.map((items) => "${items.name}(${_formatPrice(items.price)})").join("");
  }
  String displayCartBill(){
    final bill = StringBuffer();
    //bill.writeln("Here's your receipt");
    bill.writeln();

    String formattedDate = DateFormat ('dd-MM-yyyy HH:mm') .format(DateTime.now());
    bill.writeln(formattedDate);
    bill.writeln();
    bill.writeln("Here's your receipt");
    bill.writeln("------------------");

    for (final items in _items){
      bill.writeln("${items.quantity}x ${items.name}-${_formatPrice(items.price)}");
      
    }
    bill.writeln("------------------");
    bill.writeln();
    bill.writeln("Total price: ${_formatPrice(totalAmount)}");

    return bill.toString();
  }
}
import 'package:flutter/material.dart';

class Cartmodel extends ChangeNotifier {
  // list of items on sale
  final List _shopitems = [
    ["apple", "2.00", "lib/images/apple.png"],
    ["avocado", "6.00", "lib/images/avocado.png"],
    ["banana", "1.50", "lib/images/banana.png"],
    ["blackberry", "7.50", "lib/images/blackberry.png"],
    ["cherries", "6.50", "lib/images/cherries.png"],
    ["coconut", "10.00", "lib/images/coconut.png"],
    ["figs", "3.00", "lib/images/figs.png"],
    ["grapes", "3.50", "lib/images/grapes.png"],
    ["kiwi", "4.50", "lib/images/kiwi.png"],
    ["mango", "2.67", "lib/images/mango.png"],
    ["orange", "1.69", "lib/images/orange.png"],
    ["peach", "3.50", "lib/images/peach.png"],
    ["pear", "7.50", "lib/images/pear.png"],
    ["pineapple", "9.00", "lib/images/pineapple.png"],
    ["strawberry", "6.50", "lib/images/strawberry.png"],
    ["watermelon", "6.00", "lib/images/watermelon.png"],
  ];
  // list of cart items
  final List _cartitems = [];

  List get shopitems => _shopitems;

  List get cartitems => _cartitems;

  // add items to cart
  void additemstocart(int index) {
    _cartitems.add(_shopitems[index]);
    notifyListeners();
  }

  // remove items from cart
  void removeitemsfromcart(int index) {
    _cartitems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculatetotalprice() {
    double totalprice = 0;
    for (int i = 0; i < _cartitems.length; i++) {
      totalprice += double.parse(_cartitems[i][1]);
    }
    return totalprice.toStringAsFixed(2);
  }
}

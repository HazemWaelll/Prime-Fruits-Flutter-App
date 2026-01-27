import 'package:flutter/material.dart';

class Cartmodel extends ChangeNotifier {
  // list of items on sale
  final List _shopitems = [
    ["apple", "2.00", "assets/images/apple.png"],
    ["avocado", "6.00", "assets/images/avocado.png"],
    ["banana", "1.50", "assets/images/banana.png"],
    ["blackberry", "7.50", "assets/images/blackberry.png"],
    ["cherries", "6.50", "assets/images/cherries.png"],
    ["coconut", "10.00", "assets/images/coconut.png"],
    ["figs", "3.00", "assets/images/figs.png"],
    ["grapes", "3.50", "assets/images/grapes.png"],
    ["kiwi", "4.50", "assets/images/kiwi.png"],
    ["mango", "2.67", "assets/images/mango.png"],
    ["orange", "1.69", "assets/images/orange.png"],
    ["peach", "3.50", "assets/images/peach.png"],
    ["pear", "7.50", "assets/images/pear.png"],
    ["pineapple", "9.00", "assets/images/pineapple.png"],
    ["strawberry", "6.50", "assets/images/strawberry.png"],
    ["watermelon", "6.00", "assets/images/watermelon.png"],
  ];
  // list of cart items
  final List _cartitems = [];

  List get shopitems => _shopitems;

  List get cartitems => _cartitems;

  // add item or increase quantity --> used in Add to cart button
  void additemstocart(int index) {
    bool isfound = false;
    for (var item in _cartitems) {
      if (item[0] == _shopitems[index][0]) {
        item[3]++; // increase quantity
        isfound = true;
        break;
      }
    }
    if (!isfound) {
      _cartitems.add([
        _shopitems[index][0],
        _shopitems[index][1],
        _shopitems[index][2],
        1, // quantity
      ]);
    }
    notifyListeners();
  }

  // increase quantity --> used in add icon in cart containers
  incrementQuantity(int index) {
    _cartitems[index][3]++;
    notifyListeners();
  }

  // decrease quantity --> used in remove icon in cart containers
  decrementQuantity(int index) {
    _cartitems[index][3]--;
    notifyListeners();
  }

  // remove item --> used in remove & cancel icons in cart/favorites containers
  void removeitemsfromcart(int index) {
    _cartitems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculatetotalprice() {
    double totalprice = 0;
    for (var item in _cartitems) {
      totalprice += double.parse(item[1]) * item[3];
    }
    return totalprice.toStringAsFixed(2);
  }
}

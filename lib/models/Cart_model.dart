import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Cartmodel extends ChangeNotifier {
  // list of items on sale
  final List _shopitems = [
    ["apple", "75", "assets/images/apple.png"],
    ["avocado", "120", "assets/images/avocado.png"],
    ["banana", "40", "assets/images/banana.png"],
    ["blackberry", "80", "assets/images/blackberry.png"],
    ["cherries", "100", "assets/images/cherries.png"],
    ["coconut", "50", "assets/images/coconut.png"],
    ["figs", "60", "assets/images/figs.png"],
    ["grapes", "60", "assets/images/grapes.png"],
    ["kiwi", "120", "assets/images/kiwi.png"],
    ["mango", "50", "assets/images/mango.png"],
    ["orange", "30", "assets/images/orange.png"],
    ["peach", "60", "assets/images/peach.png"],
    ["pear", "60", "assets/images/pear.png"],
    ["pineapple", "100", "assets/images/pineapple.png"],
    ["strawberry", "40", "assets/images/strawberry.png"],
    ["watermelon", "15", "assets/images/watermelon.png"],
  ];
  // list of cart items
  late List _cartitems = [];
  late Box<dynamic> _cartBox;

  // Constructor
  Cartmodel() {
    _initializeCart();
  }

  // Initialize cart from Hive database
  Future<void> _initializeCart() async {
    _cartBox = Hive.box('cartBox');
    final savedItems = _cartBox.get('cartItems', defaultValue: []);
    _cartitems = List.from(savedItems);
    notifyListeners();
  }

  // Save cart items to Hive
  Future<void> _saveCart() async {
    await _cartBox.put('cartItems', _cartitems);
  }

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
    _saveCart();
    notifyListeners();
  }

  // increase quantity --> used in add icon in cart containers
  incrementQuantity(int index) {
    _cartitems[index][3]++;
    _saveCart();
    notifyListeners();
  }

  // decrease quantity --> used in remove icon in cart containers
  decrementQuantity(int index) {
    _cartitems[index][3]--;
    _saveCart();
    notifyListeners();
  }

  // remove item --> used in remove & cancel icons in cart/favorites containers
  void removeitemsfromcart(int index) {
    _cartitems.removeAt(index);
    _saveCart();
    notifyListeners();
  }

  // calculate total price
  String calculatetotalprice() {
    double totalprice = 0;
    for (var item in _cartitems) {
      totalprice += double.parse(item[1]) * item[3];
    }
    return totalprice.toStringAsFixed(1);
  }
}

import 'package:flutter/material.dart';

class Favoritemodel extends ChangeNotifier {
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
  // list of favorites items
  final List _favoriteitems = [];

  List get shopitems => _shopitems;

  List get favoriteitems => _favoriteitems;

  // check if item is in favorites
  bool isInFavorites(int index) {
    return _favoriteitems.any(
      (item) =>
          item[0] == _shopitems[index][0] &&
          item[1] == _shopitems[index][1] &&
          item[2] == _shopitems[index][2],
    );
  }

  void toggleFavorite(int index) {
    if (isInFavorites(index)) {
      _favoriteitems.removeWhere(
      (item) =>
          item[0] == _shopitems[index][0] &&
          item[1] == _shopitems[index][1] &&
          item[2] == _shopitems[index][2],
      );
    } 
    else {
      _favoriteitems.add(_shopitems[index]);
    }
    notifyListeners();
  }

  // remove item from favorites by index
  void removeFavoriteByIndex(int index) {
    if (index >= 0 && index < _favoriteitems.length) {
      _favoriteitems.removeAt(index);
      notifyListeners();
    }
  }
}

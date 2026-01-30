import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Favoritemodel extends ChangeNotifier {
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
  // list of favorites items
  late List _favoriteitems = [];
  late Box<dynamic> _favoritesBox;

  // Constructor
  Favoritemodel() {
    _initializeFavorites();
  }

  // Initialize favorites from Hive database
  Future<void> _initializeFavorites() async {
    _favoritesBox = Hive.box('favoritesBox');
    final savedItems = _favoritesBox.get('favoriteItems', defaultValue: []);
    _favoriteitems = List.from(savedItems);
    notifyListeners();
  }

  // Save favorites to Hive
  void _saveFavorites() {
    _favoritesBox.put('favoriteItems', _favoriteitems);
  }

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
    } else {
      _favoriteitems.add(_shopitems[index]);
    }
    _saveFavorites();
    notifyListeners();
  }

  // remove item from favorites by index
  void removeFavoriteByIndex(int index) {
    if (index >= 0 && index < _favoriteitems.length) {
      _favoriteitems.removeAt(index);
      _saveFavorites();
      notifyListeners();
    }
  }
}

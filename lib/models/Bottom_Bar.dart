import 'package:flutter/material.dart';
import 'package:prime_fruits/models/Favorite_model.dart';
import 'package:prime_fruits/pages/Home_page.dart';
import 'package:prime_fruits/pages/Favorites_page.dart';
import 'package:prime_fruits/pages/Cart_page.dart';
import 'package:prime_fruits/pages/Settings_page.dart';
import 'package:provider/provider.dart';
import 'package:prime_fruits/models/Cart_model.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedindex = 0;
  List<Widget> pages = [
    const Homepage(),
    const Favoritespage(),
    const Cartpage(),
    const Settingspage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedindex],
      bottomNavigationBar: Consumer2<Cartmodel, Favoritemodel>(
        builder: (context, cartvalue, favoritevalue, child) {
          return BottomNavigationBar(
            currentIndex: selectedindex,
            onTap: onitemtapped,
            backgroundColor: Colors.white,

            selectedItemColor: Theme.of(context).hoverColor,
            selectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),

            unselectedItemColor: Colors.grey[600],
            
            items: [
              const BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),

              BottomNavigationBarItem(
                label: "Favorites",
                icon: Badge.count(
                  count: favoritevalue.favoriteitems.length,
                  isLabelVisible: favoritevalue.favoriteitems.isNotEmpty,
                  child: Icon(Icons.favorite),
                ),
              ),

              BottomNavigationBarItem(
                label: "Cart",
                icon: Badge.count(
                  count: cartvalue.cartitems.length,
                  isLabelVisible: cartvalue.cartitems.isNotEmpty,
                  child: Icon(Icons.shopping_basket),
                ),
              ),

              const BottomNavigationBarItem(
                label: "Settings",
                icon: Icon(Icons.settings),
              ),
            ],
          );
        },
      ),
    );
  }

  onitemtapped(int index) {
    selectedindex = index;
    setState(() {});
  }
}

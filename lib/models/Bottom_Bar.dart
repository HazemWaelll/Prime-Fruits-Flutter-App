import 'package:flutter/material.dart';
import 'package:prime_fruits/pages/Cart_page.dart';
import 'package:prime_fruits/pages/Favorites_page.dart';
import 'package:prime_fruits/pages/Home_page.dart';

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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedindex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: onitemtapped,
        items: [
          const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          const BottomNavigationBarItem(label: "Favorites", icon: Icon(Icons.favorite)),
          const BottomNavigationBarItem(label: "Cart", icon: Icon(Icons.shopping_basket)),
        ],
      ),
    );
  }

  onitemtapped(int index) {
    selectedindex = index;
    setState(() {});
  }
}

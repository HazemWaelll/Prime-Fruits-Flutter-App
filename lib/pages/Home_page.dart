import 'package:flutter/material.dart';
import 'package:prime_fruits/models/Favorite_model.dart';
import 'package:provider/provider.dart';
import 'package:prime_fruits/components/Food_grid.dart';
import 'package:prime_fruits/models/Cart_model.dart';
//import 'package:prime_fruits/pages/Cart_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // safe area
          SizedBox(height: 85),

          // hi there
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Hi there,"),
          ),

          SizedBox(height: 4),

          // let's order some fresh food for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Let's order some fresh food for you",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),

          // divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(),
          ),

          SizedBox(height: 24),

          // note! + grid
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 4.5),
            child: Text(
                "Note! Minimum amount to purchase is 1 kilo.",
                style: TextStyle(fontSize: 16),
            ),
          ),

          Expanded(
            child: Consumer2<Cartmodel, Favoritemodel>(
              builder: (context, cartvalue, favoritevalue, child) {
                return GridView.builder(
                  itemCount: cartvalue.shopitems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.29,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Foodgrid(
                      itemname: cartvalue.shopitems[index][0],
                      itemprice: cartvalue.shopitems[index][1],
                      imagepath: cartvalue.shopitems[index][2],
                      isFavorite: favoritevalue.isInFavorites(index),
                      onPressed: () {
                        Provider.of<Cartmodel>(
                          context,
                          listen: false,
                        ).additemstocart(index);
                        massagebar(context, "Item added to cart");
                      },
                      onFavoritePressed: () {
                        Provider.of<Favoritemodel>(
                          context,
                          listen: false,
                        ).toggleFavorite(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  massagebar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 650),
      action: SnackBarAction(label: "ok", onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

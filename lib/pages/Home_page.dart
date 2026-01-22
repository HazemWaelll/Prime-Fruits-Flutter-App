import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prime_fruits/components/Food_grid.dart';
import 'package:prime_fruits/models/Cart_model.dart';
import 'package:prime_fruits/pages/Cart_page.dart';

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

          // fresh items + grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Fresh items"),
          ),

          Expanded(
            child: Consumer<Cartmodel>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopitems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.15,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Foodgrid(
                      itemname: value.shopitems[index][0],
                      itemprice: value.shopitems[index][1],
                      imagepath: value.shopitems[index][2],
                      onPressed: () {
                        Provider.of<Cartmodel>(
                          context,
                          listen: false,
                        ).additemstocart(index);
                        massagebar(context);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      // floating action button (cart)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cartpage()),
          );
        },
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: Icon(Icons.shopping_basket),
      ),
    );
  }

  massagebar(BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: const Text("Item added successfully to the cart"),
      duration: const Duration(milliseconds: 650),
      action: SnackBarAction(label: "ok", onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

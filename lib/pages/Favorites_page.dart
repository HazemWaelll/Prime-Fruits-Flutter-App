import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prime_fruits/models/Favorite_model.dart';

class Favoritespage extends StatelessWidget {
  const Favoritespage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<Favoritemodel>(
        builder: (context, favoritevalue, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // safe area
              const SizedBox(height: 28,),

              // My Favorites
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Favorites",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),

              // Favorites Items
              Expanded(
                child: favoritevalue.favoriteitems.isEmpty? 
                      Center(
                        child: Text(
                          "Favorites is empty",
                          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: favoritevalue.favoriteitems.length,
                        padding: EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading: Image.asset(
                                  favoritevalue.favoriteitems[index][2],
                                  height: 36,
                                ),
                                title: Text(favoritevalue.favoriteitems[index][0]),
                                // ignore: prefer_interpolation_to_compose_strings
                                subtitle: Text('\$' + favoritevalue.favoriteitems[index][1]),
                                trailing: IconButton(
                                  onPressed: () {
                                    Provider.of<Favoritemodel>(
                                      context,
                                      listen: false,
                                    ).removeFavoriteByIndex(index);
                                  },
                                  icon: Icon(Icons.cancel),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Foodgrid extends StatelessWidget {
  final String itemname;
  final String itemprice;
  final String imagepath;
  final void Function()? onPressed;
  final void Function()? onFavoritePressed;
  final bool isFavorite;

  const Foodgrid({
    super.key,
    required this.itemname,
    required this.itemprice,
    required this.imagepath,
    required this.onPressed,
    this.onFavoritePressed,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(11),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // icon
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onFavoritePressed,
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                color: Colors.red,
                iconSize: 28,
              ),
            ],
          ),

          // image
          Transform.translate(
            offset: const Offset(0, -20),
            child: Image.asset(imagepath, height: 80),
          ),

          // name
          Transform.translate(
            offset: const Offset(0, -18),
            child: Text(
              itemname,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          // price
          Transform.translate(
            offset: Offset(0, -16),
            child: Text(
              '\$$itemprice',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          // add to cart
          Transform.translate(
            offset: const Offset(0, -15),
            child: MaterialButton(
              onPressed: onPressed,
              color: Theme.of(context).highlightColor,
              child: Text('Add To Cart', style: Theme.of(context).textTheme.titleSmall,),
            ),
          ),
        ],
      ),
    );
  }
}

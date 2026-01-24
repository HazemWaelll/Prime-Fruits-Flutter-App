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
        color: Colors.grey[350],
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
          Image.asset(imagepath, height: 90),

          // name
          Text(itemname, style: TextStyle(fontSize: 20)),

          // price
          Text(
            '\$$itemprice',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          ),

          // add to cart
          MaterialButton(
            onPressed: onPressed,
            color: Colors.greenAccent,
            child: Text('Add To Cart', style: TextStyle(fontSize: 17)),
          ),
        ],
      ),
    );
  }
}

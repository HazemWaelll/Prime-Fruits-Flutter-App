import 'package:flutter/material.dart';

class Foodgrid extends StatelessWidget {
  final String itemname;
  final String itemprice;
  final String imagepath;
  final void Function()? onPressed;

  const Foodgrid({
    super.key,
    required this.itemname,
    required this.itemprice,
    required this.imagepath,
    required this.onPressed,
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
          // image
          Image.asset(imagepath, height: 90),

          // text
          Text(itemname, style: TextStyle(fontSize: 20)),

          // price
          MaterialButton(
            onPressed: onPressed,
            color: Colors.amber,
            child: Text(
              '\$$itemprice',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}

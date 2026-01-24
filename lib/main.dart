import 'package:flutter/material.dart';
import 'package:prime_fruits/models/Favorite_model.dart';
import 'package:provider/provider.dart';
import 'package:prime_fruits/models/Cart_model.dart';
import 'package:prime_fruits/pages/Intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cartmodel(),),
        ChangeNotifierProvider(create: (context) => Favoritemodel(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Intropage(),
      ),
    );
  }
}

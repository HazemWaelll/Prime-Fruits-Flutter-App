import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/Cart_model.dart';
import 'package:shopping_app/pages/Intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cartmodel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Intropage(),
      ),
    );
  }
}

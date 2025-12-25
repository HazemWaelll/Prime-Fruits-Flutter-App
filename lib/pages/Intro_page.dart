import 'package:flutter/material.dart';
import 'package:shopping_app/pages/Home_page.dart';

class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // logo
          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.only(
              left: 80.0,
              right: 80,
              top: 100,
              bottom: 50,
            ),
            child: Image.asset('lib/images/figs.png'),
          ),

          // We deliver fresh food to your home
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              textAlign: TextAlign.center,
              "We deliver fresh food to your home",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),

          // subtitle
          Text("Fresh items everyday"),

          Spacer(),

          // get started button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff8c4d4d),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Spacer(),
        ],
      ),
    );
  }
}

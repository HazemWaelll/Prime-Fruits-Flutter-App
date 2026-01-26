import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prime_fruits/models/Cart_model.dart';
import 'package:prime_fruits/pages/Error_page.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<Cartmodel>(
        builder: (context, cartvalue, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // safe area
              const SizedBox(height: 28,),

              // My Cart
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),

              // Cart Items
              Expanded(
                child: cartvalue.cartitems.isEmpty?
                      Center(
                        child: Text(
                          "Cart is empty",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartvalue.cartitems.length,
                        padding: EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading: Image.asset(
                                  cartvalue.cartitems[index][2],
                                  height: 36,
                                ),
                                title: Text(
                                  cartvalue.cartitems[index][0],
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                // ignore: prefer_interpolation_to_compose_strings
                                subtitle: Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  '\$' + cartvalue.cartitems[index][1],
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    Provider.of<Cartmodel>(
                                      context,
                                      listen: false,
                                    ).removeitemsfromcart(index);
                                  },
                                  icon: Icon(Icons.cancel),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

              // Total Price Container
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${cartvalue.calculatetotalprice()}',
                            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      InkWell(
                        // OnTap
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Errorpage(),
                            ),
                          );
                        },

                        // Container
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Text(
                                "Pay Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

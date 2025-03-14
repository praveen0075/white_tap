import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_tap/components/sheo_tile.dart';
import 'package:white_tap/services/cart_services.dart';
import 'package:white_tap/models/shoe_model.dart';

class ShopePage extends StatelessWidget {
  const ShopePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: Center(child: Text("Shope")));4
   
    void addShoeToTheCart(ShoeModel shoe) {
      Provider.of<CartServies>(context, listen: false).addItemsToCart(shoe);

      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text("Successfully Added"),
              content: Text("Check your cart"),
            ),
      );
    }

    return Consumer<CartServies>(
      builder:
          (context, value, child) => Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Search", style: TextStyle(color: Colors.grey)),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "everyone flies... some fly longer than others",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Hot Picks 🔥",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.getSheoList().length,
                  itemBuilder: (context, index) {
                    ShoeModel shoe = value.getSheoList()[index];
                    return ShoeTile(
                      shoeModel: shoe,
                      onTap: () => addShoeToTheCart(shoe),
                    );
                  },
                ),
              ),
              SizedBox(height: 55),
            ],
          ),
    );
  }
}

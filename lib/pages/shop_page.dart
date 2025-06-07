import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_tap/components/item_tile.dart';
import 'package:white_tap/constants/const.dart';
import 'package:white_tap/services/cart_services.dart';
import 'package:white_tap/models/item_model.dart';

class ShopePage extends StatelessWidget {
  const ShopePage({super.key});

  @override
  Widget build(BuildContext context) {
    void addItemToCart(ItemModel item) {
      Provider.of<CartServies>(context, listen: false).addItemsToCart(item);

      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text("Item added to the cart"),
              content: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  weight: 35,
                  size: 45,
                ),
              ),
            ),
      );
    }

    return Consumer<CartServies>(
      builder:
          (context, value, child) =>  Column(
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Tune into clarity, whether it’s classic wired or modern truly wireless",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                kh10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Beat Drop Zone 🎧",
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
                kh5,
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.getItemList().length,
                    itemBuilder: (context, index) {
                      ItemModel item = value.getItemList()[index];
                      return ItemTiel(
                        itemModel: item,
                        onTap: () => addItemToCart(item),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_tap/components/cart_item.dart';
import 'package:white_tap/constants/const.dart';
import 'package:white_tap/services/cart_services.dart';
import 'package:white_tap/models/item_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartServies>(context, listen: false).getAllItemsFromDB();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartServies>(
      builder:
          (context, value, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                kh10,
                Expanded(
                  child:
                      value.getUserCart().isEmpty
                          ? Center(child: Text("Your cart is empty"))
                          : ListView.builder(
                            itemCount: value.getUserCart().length,
                            itemBuilder: (context, index) {
                              ItemModel item = value.getUserCart()[index];
                              return CartItem(item: item);
                            },
                          ),
                ),
              ],
            ),
          ),
    );
  }
}

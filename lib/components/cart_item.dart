
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_tap/services/cart_services.dart';
import 'package:white_tap/models/shoe_model.dart';

class CartItem extends StatelessWidget {
  ShoeModel shoe;
  CartItem({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    void removeItemFromCart() {
      if (shoe.id == null) {
        log('Id is null, cant do deletion');
        // log("ID is Null , can't complete deleting process");
      } else {
        Provider.of<CartServies>(
          context,
          listen: false,
        ).removeItemFromCart(shoe.id!);
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.asset(shoe.image),
        title: Text(shoe.name),
        subtitle: Text(shoe.price),
        trailing: IconButton(
          onPressed: removeItemFromCart,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}

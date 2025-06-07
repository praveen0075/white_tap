import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_tap/services/cart_services.dart';
import 'package:white_tap/models/item_model.dart';

class CartItem extends StatelessWidget {
  ItemModel item;
  CartItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    void removeItemFromCart() {
      if (item.id == null) {
        log('Id is null, cant do deletion');
      } else {
        Provider.of<CartServies>(
          context,
          listen: false,
        ).removeItemFromCart(item.id!);
      }
    }

    void deleteAlertBox(){
      showDialog(context: context, builder:(context) => AlertDialog(
        title: Text("Are you sure?",textAlign: TextAlign.center,),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          ElevatedButton(
            onPressed: () {
            removeItemFromCart();
            Navigator.pop(context);
          }, child: Text("Delete",style: TextStyle(color: Colors.red),)),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Cancel")),
        ],),
      ),);
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.asset(item.image),
        title: Text(item.name),
        subtitle: Text("₹${item.price}"),
        trailing: IconButton(
          onPressed: deleteAlertBox ,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:white_tap/models/item_model.dart';

class CartServies extends ChangeNotifier { 
  List<ItemModel> items = [
    ItemModel(
      name: "Sennheiser HD 45BT",
      price: "8,490",
      desc:
          "Experience immersive audio with active noise cancellation perfect for travel, work, or daily listening",
      image: "assets/images/sennheiser.png",
    ),
    ItemModel(
      name: "Sony XM6", 
      price: "39,990", 
      desc: "Silence the world, immerse in sound.",
      image: "assets/images/sony-headphone.png",
    ),
    ItemModel(
      name: "Realme Buds 2", 
      price: "599",
      desc: "Dive into the World of Realme Audio – Wired, We've Got You Covered!",
      image: "assets/images/realme-headset.png",  
    ),

    ItemModel(
      name: "Apple airpods 4", 
      price: "12,900",
      desc: "Redesigned open-ear structure for enhanced comfort and sound quality",
      image: "assets/images/apple-airpods.png",
    ),
    ItemModel(
      name: "boat 220 wired",
      price: "1300",
      desc: "Immerse Yourself in Signature Sound",
      image: "assets/images/boat-220-wired-headset.png",
    ),
  ];

  List<ItemModel> userCart = [];

  List<ItemModel> getItemList() {
    return items;
  }

  List<ItemModel> getUserCart() {
    if (userCart.length > 1) {
      log(userCart[1].name);
    } else {
      log("user cart is less than 2");
    }

    return userCart;
  }

  void addItemsToCart(ItemModel item) async {
    final userCartDB = Hive.box<ItemModel>("item_box");
    final _id = await userCartDB.add(item);
    item.id = _id;
    userCart.add(item);
    log(item.name);
    notifyListeners();
  }

  void removeItemFromCart(int id) async {
    final userCartDB = Hive.box<ItemModel>("item_box");
    await userCartDB.delete(id);
    getAllItemsFromDB();
    notifyListeners();
  }

  void getAllItemsFromDB() async {
    final dbValue = Hive.box<ItemModel>("item_box");
    userCart.clear();
    if (dbValue.isNotEmpty) {
      userCart.addAll(dbValue.values);
    } else {
      log("No items found in the database");
    }
    log("Loaded ${userCart.length} items for DB");
    notifyListeners();
  }
}

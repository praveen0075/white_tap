import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:white_tap/models/shoe_model.dart';

class CartServies extends ChangeNotifier {
  List<ShoeModel> shoes = [
    ShoeModel(
      name: "Zoom FREAX",
      price: "1500",
      desc: "The forward-thinking design of his latest signature shoe",
      image: "assets/images/blushoe.png",
    ),
    ShoeModel(
      name: "Air Jordans",
      price: "2200",
      desc: "You have got the hops and the speed lace up in shoes",
      image: "assets/images/orgnbluemix.png",
    ),
    ShoeModel(
      name: "KD Treys",
      price: "3000",
      desc: "2300",
      image: "assets/images/orngshoe.png",
    ),
    ShoeModel(
      name: "Kyre",
      price: "4000",
      desc: "A secure midfoot strap is suited for scoring",
      image: "assets/images/brwn.png",
    ),
  ];

  List<ShoeModel> userCart = [];

  List<ShoeModel> getSheoList() {
    return shoes;
  }

  List<ShoeModel> getUserCart() {
    if (userCart.length > 1) {
      log(userCart[1].name);
    } else {
      log("user cart is less than 2");
    }

    return userCart;
  }

  void addItemsToCart(ShoeModel shoe) async {
    final userCartDB = Hive.box<ShoeModel>("sheo_box");
    final _id = await userCartDB.add(shoe);
    shoe.id = _id;
    userCart.add(shoe);
    log(shoe.name);
    notifyListeners();
  }

  void removeItemFromCart(int id) async {
    final userCartDB = Hive.box<ShoeModel>("sheo_box");
    await userCartDB.delete(id);
    getAllItemsFromDB();
    // userCart.remove(shoe);
    notifyListeners();
  }

  void getAllItemsFromDB() async {
    final dbValue = Hive.box<ShoeModel>("sheo_box");
    // final List<ShoeModel> sheoList =
    // log(dbValue.values.elementAt(1).name.toString());
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

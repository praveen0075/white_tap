import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:white_tap/components/my_bottom_nav_bar.dart';
import 'package:white_tap/pages/cart_page.dart';
import 'package:white_tap/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void navigateFunction(int indx) {
    setState(() {
      selectedIndex = indx;
    });
    log(selectedIndex.toString());
  }

  List pages = [ShopePage(), CartPage()];

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
              ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChang: (indx) => navigateFunction(indx),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [ 
                  DrawerHeader(
                    child: Image.asset(
                      "assets/images/nikelogo.png",
                      color: Colors.white,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text("Home", style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text("About", style: TextStyle(color: Colors.white)),
                  ),  
                ],
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text("Logout", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}

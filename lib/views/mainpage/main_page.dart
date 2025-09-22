import 'package:ecommerce_app/views/category/category_page.dart';
import 'package:ecommerce_app/views/favorite/favorite_page.dart';
import 'package:ecommerce_app/views/homepage/home_page.dart';
import 'package:ecommerce_app/views/profile/profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  String routeName = "/home_page";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  var pages = [HomePage(), CategoryPage(), FavoritePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: pageIndex == 0 ? Drawer() : null,
      appBar: pageIndex == 0
          ? AppBar(
              actions: [
                Icon(Icons.search),
                SizedBox(width: 10),
                Icon(Icons.notifications),
                SizedBox(width: 10),
              ],
            )
          : null,
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        showUnselectedLabels: true,
        currentIndex: pageIndex,
        onTap: (int value) {
          pageIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

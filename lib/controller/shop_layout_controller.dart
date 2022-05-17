import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/screens/category_screen.dart';
import 'package:shop_app_num2/screens/favorite_screen.dart';
import 'package:shop_app_num2/screens/home_screen.dart';
import 'package:shop_app_num2/screens/setting_screen.dart';

class BoardingItem {
  final String label;
  final Icon icon;
  final Widget screen;

  BoardingItem({
    required this.label,
    required this.icon,
    required this.screen,
  });
}

class ShopLayoutController {
  static int currentIndex = 0;
  static List<BoardingItem> item = [
    BoardingItem(label: "Home", icon: Icon(Icons.home), screen: HomeScreen()),
    BoardingItem(label: "Categories", icon: Icon(Icons.category), screen: CategoryScreen()),
    BoardingItem(label: "Favorites", icon: Icon(Icons.favorite), screen: FavoriteScreen()),
    BoardingItem(label: "Setting", icon: Icon(Icons.settings), screen: SettingScreen()),
  ].obs;

  static void changeIndex(int newIndex) {
    currentIndex = newIndex;
  }
}

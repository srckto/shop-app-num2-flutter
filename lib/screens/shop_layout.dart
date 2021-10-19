import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop_app_num2/controller/shop_layout_controller.dart' show ShopLayoutController;

class ShopLayout extends StatefulWidget {
  ShopLayout({Key? key}) : super(key: key);

  @override
  State<ShopLayout> createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<ShopLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ShopLayoutController.item[ShopLayoutController.currentIndex].label),
      ),
      body: ShopLayoutController.item[ShopLayoutController.currentIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ShopLayoutController.currentIndex,
        onTap: (int newValue) {
          setState(() {
            ShopLayoutController.changeIndex(newValue);
          });
        },
        backgroundColor: Colors.blueAccent,
        items: ShopLayoutController.item
            .map(
              (element) => BottomNavigationBarItem(
                label: element.label,
                icon: element.icon,
                backgroundColor: context.theme.primaryColor,
              ),
            )
            .toList(),
      ),
    );
  }
}

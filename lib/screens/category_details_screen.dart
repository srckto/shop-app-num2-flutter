import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/controller/category_details_controller.dart';
import 'package:shop_app_num2/models/category_model.dart';

import '../widgets/product_grid_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final CategoryDataModel model;
  CategoryDetailsScreen({Key? key, required this.model}) : super(key: key);
  final _controller = Get.put(CategoryDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _controller.getData(model.id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error in network"));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1.7,
              children: List.generate(
                _controller.products.length,
                (index) => ProductGridWidget(
                  product: _controller.products[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

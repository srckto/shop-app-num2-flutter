import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/controller/category_controller.dart';
import 'package:shop_app_num2/models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  final _categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _categoryController.getCategoryData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else
          return ListView.builder(
            itemCount: _categoryController.categoryModel!.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(context, _categoryController.categoryModel!.data![index]);
            },
          );
      },
    );
  }

  Padding _buildItem(BuildContext context, CategoryDataModel model) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: FadeInImage(
              placeholder: AssetImage("assets/images/wait_image.jpg"),
              image: NetworkImage(
                model.image,
              ),
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              model.name,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
}

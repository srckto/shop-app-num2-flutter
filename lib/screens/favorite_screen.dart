import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/constant.dart';
import 'package:shop_app_num2/controller/product_controller.dart';
import 'package:shop_app_num2/models/home_model.dart';
import 'package:shop_app_num2/widgets/build_image.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (_productController.state.value == true) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else {
          return _productController.allProductFavorite.isEmpty
              ? Center(
                  child: Text(
                    "Not Found Any Favorite Product",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )
              : ListView.builder(
                  itemCount: _productController.allProductFavorite.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildItem(
                      context,
                      _productController.allProductFavorite[index],
                    );
                  },
                );
        }
      },
    );
  }

  Padding _buildItem(
    BuildContext context,
    ProductModel model,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          BuildImage(imageUrl: model.image!, width: 90, height: 90, radius: 5),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    model.name!,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "${model.price!}",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${model.old_price!}",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              _productController.deleteFavoriteProduct(model);
            },
            icon: Icon(Icons.favorite),
          )
        ],
      ),
    );
  }
}

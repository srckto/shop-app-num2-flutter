import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:shop_app_num2/controller/product_controller.dart';
import 'package:shop_app_num2/models/home_model.dart';

class ProductGridWidget extends StatelessWidget {
  final ProductModel product;
  ProductGridWidget({required this.product});
  final _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            FadeInImage(
              placeholder: AssetImage("assets/images/wait_image.jpg"),
              image: NetworkImage(
                product.image!,
              ),
              width: double.infinity,
              height: 200,
            ),
            if (product.old_price != 0)
              Container(
                color: Colors.red,
                padding: EdgeInsets.all(5),
                child: Text(
                  "DISCOUNT",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.headline2!.copyWith(
                  height: 1.3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    "\$${product.price.toStringAsFixed(1)}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.headline1!.copyWith(
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 5),
                  if (product.old_price != 0)
                    Text(
                      "\$ ${product.old_price.toStringAsFixed(1)}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.headline1!.copyWith(
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      _productController.changeFavorite(product.id!);
                    },
                    icon: _productController.changeIcon(product) ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

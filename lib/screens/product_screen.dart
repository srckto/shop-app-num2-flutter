import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/controller/product_controller.dart';
import 'package:shop_app_num2/widgets/product_grid_widget.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _productController = Get.put(ProductController());
  // final _categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _productBuilder(),
    );
  }

  Widget _productBuilder() {
    return Obx(
      () {
        if (_productController.state.value == true)
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        else
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                CarouselSlider(
                  items: _productController.homeModel!.data!.banners
                      .map(
                        (element) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                              placeholder: AssetImage("assets/images/wait_image.jpg"),
                              image: NetworkImage(
                                element.image!,
                              ),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 220,
                    reverse: false,
                    aspectRatio: 30,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 4),
                    autoPlayAnimationDuration: Duration(seconds: 4),
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ),
                SizedBox(height: 10),
                // Container(
                //   height: 100,
                //   padding: EdgeInsets.symmetric(horizontal: 15),
                //   child: ListView.separated(
                //     physics: BouncingScrollPhysics(),
                //     separatorBuilder: (ctx, index) => SizedBox(width: 15),
                //     scrollDirection: Axis.horizontal,
                //     // shrinkWrap: true,
                //     itemCount: _categoryController.categoryModel!.data!.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Image.network(_categoryController.categoryModel!.data![index].image);
                //     },
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(
                    "Products",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1 / 1.7,
                  children: List.generate(
                    _productController.homeModel!.data!.products.length,
                    (index) => ProductGridWidget(
                      product: _productController.homeModel!.data!.products[index],
                    ),
                  ),
                ),
              ],
            ),
          );
      },
    );
  }
}

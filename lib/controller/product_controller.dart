import 'package:get/get.dart';
import 'package:shop_app_num2/controller/cache_helper.dart';
import 'package:shop_app_num2/controller/network/end_point.dart';
import 'package:shop_app_num2/models/favorite_model.dart';
import 'package:shop_app_num2/models/home_model.dart';

import 'network/dio_helper.dart';

class ProductController extends GetxController {
  HomeModel? homeModel;
  ChangeFavoriteModel? changeFavoriteModel;
  Map<int, bool> favoriteProduct = {};

  RxBool state = false.obs;
  GetFavoriteModel? getFavoriteModel;
  RxList allProductFavorite = RxList<ProductModel>([]);

  @override
  void onInit() async {
    state.value = true;

    await getHomeData();
    await getFavoriteProduct();

    state.value = false;
    super.onInit();
  }

  bool changeIcon(ProductModel product) {
    if (allProductFavorite.contains(product)) {
      print("changeIcon");
      return true;
    } else
      return false;
  }

  Future changeFavorite(int id) async {
    String token = CacheHelper.getData(key: "token");

    return await DioHelper.postData(
      url: GET_FAVORITE_URL,
      data: {"product_id": id},
      token: token,
    ).then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
      getFavoriteProduct();
      print(changeFavoriteModel!.message);
    }).catchError((error) {});
  }

  Future getHomeData() async {
    return await DioHelper.getData(url: GET_HOME_URL).then((value) {
      if (value.data != null) {
        homeModel = HomeModel.formJsom(value.data);

        homeModel!.data!.products.forEach((element) {
          favoriteProduct.addAll({
            element.id!: element.in_favorites!,
          });
        });
        print(favoriteProduct);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  deleteFavoriteProduct(ProductModel product) async {
    allProductFavorite.remove(product);
    await changeFavorite(product.id!);
    print(product.id);
  }

  Future getFavoriteProduct() async {
    String token = CacheHelper.getData(key: "token");

    return await DioHelper.getData(url: GET_FAVORITE_URL, token: token).then((value) {
      getFavoriteModel = GetFavoriteModel.fromJson(value.data);
      List<ProductModel> newList = [];

      getFavoriteModel!.data.forEach((element) {
        newList.add(element.product!);
      });

      allProductFavorite.value = newList;
    }).catchError((error) {
      print(error.toString());
    });
  }
}

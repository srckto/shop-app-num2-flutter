import 'package:shop_app_num2/constant.dart';

class HomeModel {
  bool? status;
  HomeDataModel? data;
  HomeModel.formJsom(Map<String, dynamic> jsonData) {
    status = jsonData["status"];
    data = HomeDataModel.formJsom(jsonData["data"]);
  }
}

class HomeDataModel {
  List<BannerModel> banners = [];
  List<ProductModel> products = [];

  HomeDataModel.formJsom(Map<String, dynamic> jsonData) {
    jsonData["banners"].forEach((element) {
      banners.add(BannerModel.formJsom(element));
    });
    jsonData["products"].forEach((element) {
      products.add(ProductModel.formJsom(element));
    });
  }
}

class BannerModel {
  int? id;
  String? image;

  BannerModel.formJsom(Map<String, dynamic> jsonData) {
    id = jsonData["id"];
    image = jsonData["image"];
  }
}

class ProductModel {
  int? id;
  var price;
  var old_price;
  var discount;
  String? image;
  String? name;
  String? description;
  List<dynamic>? images;
  bool? in_favorites;
  bool? in_cart;

  ProductModel.formJsom(Map<String, dynamic> jsonData) {
    id = jsonData["id"];
    price = jsonData["price"];
    old_price = jsonData["old_price"];
    discount = jsonData["discount"];
    image = jsonData["image"] ?? k_notImage;
    name = jsonData["name"];
    description = jsonData["description"];
    images = jsonData["images"];
    in_favorites = jsonData["in_favorites"];
    in_cart = jsonData["in_cart"];
  }
}

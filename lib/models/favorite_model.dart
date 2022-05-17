import 'package:shop_app_num2/models/home_model.dart';

class ChangeFavoriteModel {
  late bool status;
  late String message;

  ChangeFavoriteModel.fromJson(Map<String, dynamic> jsonData) {
    status = jsonData["status"];
    message = jsonData["message"];
  }
}

class FavoriteModel {
  bool? status;
  List<FavoriteData> data = [];

  FavoriteModel.fromJson(Map<String, dynamic> jsonData) {
    status = jsonData["status"];
    jsonData["data"]["data"].forEach((element) {
      data.add(FavoriteData.fromJson(element));
    });
  }
}

class FavoriteData {
  int? id;
  ProductModel? product;

  FavoriteData.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData["id"];
    product = ProductModel.formJsom(jsonData["product"]);
  }
}

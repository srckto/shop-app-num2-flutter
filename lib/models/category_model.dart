import 'package:shop_app_num2/constant.dart';

class CategoryModel {
  late bool status;
  late List<CategoryDataModel>? data = [];

  CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    status = jsonData["status"];
    jsonData["data"]["data"].forEach(
      (element) {
        data!.add(CategoryDataModel.fromJson(element));
      },
    );
  }
}

class CategoryDataModel {
  late int id;
  late String name;
  late String image;

  CategoryDataModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData["id"];
    name = jsonData["name"];
    image = jsonData["image"] ?? k_notImage;
  }
}

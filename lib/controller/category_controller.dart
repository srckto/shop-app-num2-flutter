import 'package:get/get.dart';
import 'package:shop_app_num2/controller/network/dio_helper.dart';
import 'package:shop_app_num2/controller/network/end_point.dart';
import 'package:shop_app_num2/models/category_model.dart';

class CategoryController extends GetxController {
  CategoryModel? categoryModel;


  Future getCategoryData() async {
    return DioHelper.getData(url: GET_CATEGORY_URL).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }
}

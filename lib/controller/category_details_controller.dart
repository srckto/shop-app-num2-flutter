import 'package:get/get.dart';
import 'package:shop_app_num2/controller/network/dio_helper.dart';
import 'package:shop_app_num2/controller/network/end_point.dart';
import 'package:shop_app_num2/models/home_model.dart';

class CategoryDetailsController extends GetxController {
  List<ProductModel> products = [];

  Future<void> getData(int id) async {
    products = [];
    var res = await DioHelper.getData(url: "$GET_CATEGORY_URL/$id");
    res.data["data"]["data"].forEach((element) {
      products.add(ProductModel.formJsom(element));
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/controller/cache_helper.dart';
import 'package:shop_app_num2/controller/network/dio_helper.dart';
import 'package:shop_app_num2/controller/network/end_point.dart';
import 'package:shop_app_num2/models/login_model.dart';
import 'package:shop_app_num2/screens/shop_layout.dart';

class LoginController extends GetxController {
  RxBool state = false.obs;
  RxBool visibility = true.obs;

  late LoginModel loginModel;

  void changeVisibility() {
    visibility.value = !visibility.value;
  }

  Future login({
    required String email,
    required String password,
  }) async {
    state.value = true;
    DioHelper.postData(url: GET_LOGIN_URL, data: {
      "email": email,
      "password": password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      if (loginModel.status != null) {
        if (loginModel.status!) {
          CacheHelper.saveData(key: "token", value: loginModel.data!.token);
          Get.off(() => ShopLayout());
        } else {
          Get.snackbar(
            "Error",
            loginModel.message!,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      }

      state.value = false;
    }).catchError((error) {
      print("Error in file LoginController\n");
      print("Detail : ${error.toString()}");
      state.value = false;
    });
  }
}

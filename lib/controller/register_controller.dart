import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/controller/cache_helper.dart';
import 'package:shop_app_num2/controller/network/end_point.dart';
import 'package:shop_app_num2/models/login_model.dart';
import 'package:shop_app_num2/screens/shop_layout.dart';

import 'network/dio_helper.dart';

class RegisterController extends GetxController {
  RxBool state = false.obs;
  RxBool visibility = true.obs;

  late LoginModel loginModel;

  void changeVisibility() {
    visibility.value = !visibility.value;
  }

  Future register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    state.value = true;
    DioHelper.postData(url: GET_REGISTER_URL, data: {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
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
      print("Error in file RegisterController\n");
      print("Detail : ${error.toString()}");
      state.value = false;
    });
  }
}

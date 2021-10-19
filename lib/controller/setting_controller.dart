import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/controller/cache_helper.dart';
import 'package:shop_app_num2/controller/login_controller.dart';
import 'package:shop_app_num2/controller/network/end_point.dart';
import 'package:shop_app_num2/models/login_model.dart';

import 'network/dio_helper.dart';

class SettingController extends GetxController {
  LoginController _loginController = Get.put(LoginController());

  late LoginModel loginModel;

  RxBool stateUpdate = false.obs;

  Future getUserData() async {
    String token = CacheHelper.getData(key: "token");
    return DioHelper.getData(url: GET_PROFILE_URL, token: token).then((value) {
      loginModel = LoginModel.fromJson(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future updataUserData({
    required String name,
    required String email,
    required String phone,
  }) async {
    stateUpdate.value = true;
    String token = CacheHelper.getData(key: "token");
    return await DioHelper.putData(
      url: GET_UPDATA_URL,
      data: {
        "name": name,
        "email": email,
        "phone": phone,
      },
      token: token,
    ).then((value) {
      _loginController.loginModel = LoginModel.fromJson(value.data);
      stateUpdate.value = false;
      Get.snackbar(
        "Test Only",
        "Complete Update",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    }).catchError((error) {
      print(error.toString());
    });
  }
}

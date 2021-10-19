import 'package:shop_app_num2/models/user_model.dart';

class LoginModel {
  bool? status;
  String? message;
  UserData? data;

  LoginModel.fromJson(Map<String, dynamic> jsonData) {
    this.status = jsonData["status"];
    this.message = jsonData["message"];
    this.data = jsonData["data"] != null ? UserData.fromJson(jsonData["data"]) : null;
  }
}

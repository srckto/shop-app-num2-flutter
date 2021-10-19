import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/controller/cache_helper.dart';
import 'package:shop_app_num2/controller/setting_controller.dart';
import 'package:shop_app_num2/widgets/defult_icon.dart';

import 'login_screen.dart';

// ignore: must_be_immutable
class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final SettingController _settingController = Get.put(SettingController());

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _settingController.getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else {
          _name.text = _settingController.loginModel.data!.name;
          _email.text = _settingController.loginModel.data!.email;
          _phone.text = _settingController.loginModel.data!.phone;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(
                () => Column(
                  
                  children: [
                    if (_settingController.stateUpdate.value == true)
                      LinearProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        label: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("Name"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: _name,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Please enter your name";
                        } else
                          return null;
                      },
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.email),
                        label: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("Email"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Please enter your email";
                        } else
                          return null;
                      },
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.phone),
                        label: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("Phone"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: _phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Please enter your phone number";
                        } else
                          return null;
                      },
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DefultIcon(
                          label: "Update",
                          onPressed: () {
                            // Get.off(() => LoginScreen());
                            _settingController.updataUserData(
                              name: _name.text,
                              email: _email.text,
                              phone: _phone.text,
                            );
                          },
                          elevation: 0.0,
                          horizontalPadding: 30,
                        ),
                        DefultIcon(
                          label: "LogOut",
                          onPressed: () {
                            Get.off(() => LoginScreen());
                            CacheHelper.removeData(key: "token");
                          },
                          elevation: 0.0,
                          horizontalPadding: 30,
                          primaryColor: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

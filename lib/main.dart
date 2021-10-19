import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app_num2/constant.dart';
import 'package:shop_app_num2/controller/cache_helper.dart';
import 'package:shop_app_num2/controller/network/dio_helper.dart';
import 'package:shop_app_num2/controller/setting_controller.dart';
import 'package:shop_app_num2/screens/login_screen.dart';
import 'package:shop_app_num2/screens/on_boarding_screen.dart';
import 'package:shop_app_num2/screens/shop_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await GetStorage.init();
  SettingController().getUserData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  Widget _getDefultScreen() {

    if (CacheHelper.getData(key: "OnBoardingScreen") == true) {
      if (CacheHelper.getData(key: "token") != null)
        return ShopLayout();
      else
        return LoginScreen();
    } else
      return OnBoardingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: k_primiryColor,
        ),
        canvasColor: k_canvas,
        primaryColor: k_primiryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: k_primiryColor,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: k_canvas,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        fontFamily: "IBM",
        textTheme: TextTheme(
          headline1: TextStyle(
            color: k_fontColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
          headline3: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        brightness: Brightness.light,
      ),
      home: _getDefultScreen(),
    );
  }
}

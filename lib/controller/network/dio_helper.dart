import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? language,
    String? token,
  }) async {
    dio!.options.headers = {
      "lang": language ?? "en",
      "Authorization": token ?? "",
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? language,
    String? token,
  }) async {
    dio!.options.headers = {
      "lang": language ?? "en",
      "Authorization": token ?? "",
    };
    return dio!.post(
      url,
      data: data,
    );
  }

   static Future putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? language,
    String? token,
  }) async {
    dio!.options.headers = {
      "lang": language ?? "en",
      "Authorization": token ?? "",
    };
    return dio!.put(
      url,
      data: data,
    );
  }
}

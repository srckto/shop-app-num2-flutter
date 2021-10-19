import 'package:get_storage/get_storage.dart';

class CacheHelper {
  static GetStorage _box = GetStorage();

  static Future saveData({
    required String key,
    required dynamic value,
  }) async {
    return await _box.write(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return _box.read(key);
  }

  static Future removeData({
    required String key,
  }) async {
   return await _box.remove(key);
  }
}

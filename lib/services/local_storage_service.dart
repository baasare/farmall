import 'package:shared_preferences/shared_preferences.dart';

// LocalStorageService class contains static methods that handle saving/retrieving/removing to/from temporary storage

class LocalStorageService {
  // dynamically save any dataType to storage using sharedPreferences
  // accepts the data's name/key and the data's value
  static void saveToDisk<T>(String key, T content) async {
    print('(TRACE) LocalStorageService:saveToDisk. key: $key value: $content');

    final prefs = await SharedPreferences.getInstance();

    if (content is String) {
      prefs.setString(key, content);
    }
    if (content is bool) {
      prefs.setBool(key, content);
    }
    if (content is int) {
      prefs.setInt(key, content);
    }
    if (content is double) {
      prefs.setDouble(key, content);
    }
    if (content is List<String>) {
      prefs.setStringList(key, content);
    }
  }

  // retrieve data from sharedPreferences storage. accepts the data's name/key
  static Future<dynamic> getFromDisk(String key) async {
    final prefs = await SharedPreferences.getInstance();
    var value = prefs.get(key);
    print('(TRACE) LocalStorageService:getFromDisk. key: $key value: $value');
    return value;
  }

  // remove data from sharedPreferences storage. accepts the data's name/key
  static Future<bool> removeFromDisk(String key) async {
    final prefs = await SharedPreferences.getInstance();
    var value = prefs.get(key);
    print(
        '(TRACE) LocalStorageService:removeFromDisk. key: $key value: $value');

    var removed = prefs.remove(key);

    return removed;
  }
}

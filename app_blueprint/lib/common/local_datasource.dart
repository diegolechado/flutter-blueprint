import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSourceType {
  SharedPreferences get sharedPreferences;
}

class LocalDataSource extends LocalDataSourceType {
  final String key = '_userToken';
  final SharedPreferences sharedPreferences;

  LocalDataSource({required this.sharedPreferences});

  setValue<T>(String key, T value) async {
    switch (T) {
      case String:
        sharedPreferences.setString(key, value as String);
        break;
      case int:
        sharedPreferences.setInt(key, value as int);
        break;
      case bool:
        sharedPreferences.setBool(key, value as bool);
        break;
      case double:
        sharedPreferences.setDouble(key, value as double);
        break;
    }
  }

  Future<T?> getData<T>(String key) async {
    T? res;
    switch (T) {
      case String:
        res = sharedPreferences.getString(key) as T;
        break;
      case int:
        res = sharedPreferences.getInt(key) as T;
        break;
      case bool:
        res = sharedPreferences.getBool(key) as T;
        break;
      case double:
        res = sharedPreferences.getDouble(key) as T;
        break;
    }
    return res;
  }

  void removeValues() async {
    sharedPreferences.remove(key);
  }
}

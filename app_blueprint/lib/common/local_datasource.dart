import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSourceType {
  SharedPreferences get sharedPreferences;
  String get value;
}

class LocalDataSource extends LocalDataSourceType {
  final String key = '_userToken';
  final String value;
  final SharedPreferences sharedPreferences;

  LocalDataSource({required this.sharedPreferences, required this.value});

  void setValue() async {
    sharedPreferences.setString(this.key, this.value);
  }

  String getValue() {
    return sharedPreferences.getString(key) ?? '';
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtil {
    Future<bool> clear() async {
        final sp = await SharedPreferences.getInstance();
        return sp.clear();
    }

    Future<bool> save(String key, value) async {
        final sp = await SharedPreferences.getInstance();
        switch(value.runtimeType) {
            case String:
                return sp.setString(key, value);
            case int:
                return sp.setInt(key, value);
            case double:
                return sp.setDouble(key, value);
            case bool:
                return sp.setBool(key, value);
            default:
                return false;
        }
    }

    dynamic read(String key, type) async {
        final sp = await SharedPreferences.getInstance();
        switch(type) {
            case String:
                return sp.getString(key);
            case int:
                return sp.getInt(key);
            case double:
                return sp.getDouble(key);
            case bool:
                return sp.getBool(key);
        }
    }
}
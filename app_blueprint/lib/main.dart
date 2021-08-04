import 'package:app_blueprint/feature_home/presentation/home_screen.dart';
import 'package:app_blueprint/feature_settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/local_datasource.dart';

void main() {
  runApp(BlueprintApp());
}

class BlueprintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(title: "Blueprint app"),
        "/settings": (context) => SettingsScreen(_saveUserToken)
      },
    );
  }

  void _saveUserToken(String userToken) async {
    final String key = '_userToken';
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    LocalDataSource(sharedPreferences: sharedPreferences)
        .setValue(key, userToken);
    LocalDataSource(sharedPreferences: sharedPreferences)
        .getData<String>(key)
        .then((value) => print(value));
  }
}

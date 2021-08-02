import 'package:app_blueprint/feature_home/presentation/home_screen.dart';
import 'package:app_blueprint/feature_settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
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
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, userToken);

    print(sharedPreferences.getString(key) ?? 'String not found');
  }
}

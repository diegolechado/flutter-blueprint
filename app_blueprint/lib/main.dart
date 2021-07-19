import 'package:app_blueprint/home/presentation/home_screen.dart';
import 'package:app_blueprint/settings/settings_screen.dart';
import 'package:flutter/material.dart';

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
        "/settings": (context) => SettingsScreen()
      },
    );
  }
}

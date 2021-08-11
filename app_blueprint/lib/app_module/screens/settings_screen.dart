import 'package:app_blueprint/design_system/button.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Settings"),
          ),
          body: Container(
              margin: EdgeInsets.all(DSSpacing.m),
              child: Column(
                  children: [
                      TextField(
                          decoration: InputDecoration(labelText: "API Token"),
                          onSubmitted: (text) => {}
                      ),
                      Container(
                          padding: EdgeInsets.all(DSSpacing.m),
                          child: DSButton(
                            title: "Salvar",
                            onPressed: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              String? x = prefs.getString('num');
                              print(x);
                            },
                          )
                      )
                  ]
              )
          )
      );
    }
}
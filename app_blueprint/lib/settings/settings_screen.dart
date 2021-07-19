import 'package:app_blueprint/design_system/button.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';

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
          margin: EdgeInsets.all(Spacing.m),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "API Token"),
                onChanged: (text) {},
              ),
              Container(
                padding: EdgeInsets.all(Spacing.m),
                child: DSButton(
                  title: "Salvar",
                  onPressed: () => {},
                ),
              )
            ],
          ),
        ));
  }
}

import 'package:app_blueprint/design_system/button.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:app_blueprint/utils/local_storage_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsScreen extends StatelessWidget {
  String? token;

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
                      onChanged: (text) => token = text
                  ),
                  Container(
                      padding: EdgeInsets.all(DSSpacing.m),
                      child: DSButton(
                          title: "Salvar",
                          onPressed: () async => await Modular.get<LocalStorageUtil>().save('API-Token', token)
                      )
                  )
                ]
            )
        )
    );
  }
}
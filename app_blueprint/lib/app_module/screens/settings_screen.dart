import 'package:app_blueprint/design_system/button.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:app_blueprint/utils/local_storage_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsScreen extends StatefulWidget {
  String? token;

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
                          onChanged: (text) => widget.token = "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"
                      ),
                      Container(
                          padding: EdgeInsets.all(DSSpacing.m),
                          child: DSButton(
                            title: "Salvar",
                            onPressed: onPressed
                          )
                      )
                  ]
              )
          )
      );
    }

    void onPressed() async {
        bool x = await Modular.get<LocalStorageUtil>().save('API-Token', widget.token);
        print(widget.token);
        print(x);
    }
}
import 'package:app_blueprint/design_system/button.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final void Function(String) onSubmit;

  SettingsScreen(this.onSubmit);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final userTokenController = TextEditingController();

  _submitUserToken() {
    final userToken = userTokenController.text;

    if (userToken.isEmpty) return;

    widget.onSubmit(userToken);
    Navigator.of(context).pop();
  }

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
                controller: userTokenController,
                onSubmitted: (_) => _submitUserToken(),
                decoration: InputDecoration(labelText: "API Token"),
              ),
              Container(
                padding: EdgeInsets.all(DSSpacing.m),
                child: DSButton(
                  title: "Salvar",
                  onPressed: _submitUserToken,
                ),
              )
            ],
          ),
        ));
  }
}

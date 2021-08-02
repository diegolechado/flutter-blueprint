import 'dart:convert';

import 'package:app_blueprint/design_system/search_box.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.title});

  final String basicAuth =
      'Basic ' + base64Encode(utf8.encode('diegolechado:PERSONAL_TOKEN'));

  final String title;

  onSearch(String text) {
    print(text);
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => {Navigator.pushNamed(context, "/settings")})
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(DSSpacing.m),
          child: Column(
            children: [
              DSSearchBox(
                  placeholder: "Repository name", onSearch: widget.onSearch)
            ],
          ),
        ));
  }
}

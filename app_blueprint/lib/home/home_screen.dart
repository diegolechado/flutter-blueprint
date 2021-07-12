import 'package:app_blueprint/design_system/search_box.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.title});

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
        ),
        body: Container(
          margin: EdgeInsets.all(Spacing.m),
          child: Column(
            children: [
              SearchBox(
                placeholder: "Repository name",
                onSearch: widget.onSearch,
              )
            ],
          ),
        ));
  }
}

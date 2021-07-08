import 'package:flutter/material.dart';

void main() {
  runApp(BlueprintApp());
}

class BlueprintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Blueprint app'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(labelText: "Repository name"),
                  )),
                  IconButton(icon: Icon(Icons.search), onPressed: () {})
                ],
              )
            ],
          ),
        ));
  }
}

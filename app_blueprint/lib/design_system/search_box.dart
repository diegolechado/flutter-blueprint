import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final String placeholder;
  final Function(String text) onSearch;
  String? text;

  SearchBox({required this.placeholder, required this.onSearch});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          decoration: InputDecoration(labelText: widget.placeholder),
          onChanged: (text) {
            widget.text = text;
          },
        )),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => {
            if (widget.text != null) {widget.onSearch(widget.text!)}
          },
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DSSearchBox extends StatefulWidget {
  final String placeholder;
  final Function(String text) onSearch;
  String? text;

  DSSearchBox({required this.placeholder, required this.onSearch});

  @override
  _DSSearchBoxState createState() => _DSSearchBoxState();
}

class _DSSearchBoxState extends State<DSSearchBox> {
    @override
    Widget build(BuildContext context) {
        return Row(
            children: [
                Expanded(
                    child: TextField(
                    decoration: InputDecoration(labelText: widget.placeholder),
                    onChanged: (text) {
                        setState(() {
                          widget.text = text;
                        });
                    }
                )),
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => {
                      if(widget.text != null)
                        widget.onSearch(widget.text!)
                    }
                )
            ]
        );
    }
}
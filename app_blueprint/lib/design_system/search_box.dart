import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DSSearchBox extends StatefulWidget {
  final String placeholder;
  final Function(String text) onSearch;
  String? text;

  DSSearchBox({required this.placeholder, required this.onSearch});

  @override
  _DSSearchBoxState createState() => _DSSearchBoxState();
}

class _DSSearchBoxState extends State<DSSearchBox> {
    final FocusNode _focusNode = FocusNode();

    @override
    Widget build(BuildContext context) {
        return TextFormField(
            focusNode: _focusNode,
            onChanged: (text) {
                setState(() {
                  widget.text = text;
                });
            },
            style: GoogleFonts.roboto(
                color: Color(0xFF000000),
                fontWeight: FontWeight.w400
            ),
            decoration: InputDecoration(
                counterText: "",
                labelText: widget.placeholder,
                labelStyle: GoogleFonts.roboto(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400
                ),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF000000))),
                contentPadding: EdgeInsets.only(bottom: DSSpacing.s),
                suffixIcon: IconButton(
                    iconSize: 20,
                    color: Color(0xFF000000),
                    icon: Icon(Icons.search),
                    onPressed: () {
                      if(widget.text != null) {
                        _focusNode.unfocus();
                        widget.onSearch(widget.text!);
                      }
                    }
                )
            )
        );
    }
}
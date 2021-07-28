import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';

class DSButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  DSButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(DSSpacing.m),
        primary: Colors.blue,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

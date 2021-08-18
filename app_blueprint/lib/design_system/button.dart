import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DSButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  DSButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(DSSpacing.s),
          backgroundColor: Colors.black,
          elevation: 0.0,
          shape: RoundedRectangleBorder(),
          minimumSize: Size(double.maxFinite, 50)
        ),
        onPressed: onPressed,
        child: Text(
          title.toUpperCase(),
          style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400
          )
        )
    );
  }
}

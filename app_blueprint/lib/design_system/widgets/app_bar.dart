import 'package:app_blueprint/design_system/colors.dart';
import 'package:app_blueprint/design_system/font.dart';
import 'package:flutter/material.dart';

class DSAppBar extends StatelessWidget implements PreferredSizeWidget {
    final String title;
    final List<Widget>? actions;

    const DSAppBar({required this.title, this.actions, Key? key}) : super(key: key);

    @override
    Size get preferredSize => Size.fromHeight(56);

    @override
    Widget build(BuildContext context) {
        return AppBar(
            title: Text(
                title,
                maxLines: 1,
                style: TextStyle(
                    fontFamily: DSFontFamily.GothamRegular,
                    fontSize: DSFontSize.xl,
                    color: DSColors.white
                )
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: DSColors.black,
            actions: actions
        );
    }
}
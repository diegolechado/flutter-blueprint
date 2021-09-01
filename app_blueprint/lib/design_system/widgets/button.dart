import 'package:app_blueprint/design_system/colors.dart';
import 'package:app_blueprint/design_system/font.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';

enum ColorProfileEnum { black, grey, white, disable }

class DSButton extends StatelessWidget {
    final String title;
    final ColorProfileEnum colorProfile;
    final VoidCallback? onPressed;
    final double? width;
    final double? marginTop;
    final double? marginBottom;
    final IconData? icon;
    final Color? iconColor;

    DSButton({
        required this.title,
        required this.colorProfile,
        this.onPressed,
        this.width,
        this.marginTop,
        this.marginBottom,
        this.icon,
        this.iconColor
    });

    @override
    Widget build(BuildContext context) => Container(
        width: width,
        margin: EdgeInsets.only(
            top: marginTop ?? DSSpacing.xxs,
            bottom: marginBottom ?? DSSpacing.xxs
        ),
        child: TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.all(12.0),
                backgroundColor: getBackgroundColor(),
                elevation: 0.0,
                shape: RoundedRectangleBorder(),
                side: BorderSide(
                    color: getBorderColor(),
                    width: 1
                ),
                minimumSize: Size(double.maxFinite, 40),
            ),
            onPressed: onPressed,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Expanded(
                      child: Text(
                          title.toUpperCase(),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              color: getTextColor(),
                              fontSize: DSFontSize.m,
                              fontFamily: DSFontFamily.GothamRegular,
                              fontWeight: FontWeight.w400
                          )
                      ),
                    ),
                    icon != null ? Icon(icon, color: iconColor, size: 22) : Container()
                ]
            )
        )
    );

    Color getBackgroundColor() {
        switch(colorProfile) {
            case ColorProfileEnum.black:
                return DSColors.black;
            case ColorProfileEnum.grey:
                return DSColors.disableGrey;
            case ColorProfileEnum.white:
                return DSColors.white;
            case ColorProfileEnum.disable:
                return DSColors.white;
        }
    }

    Color getTextColor() {
        switch(colorProfile) {
            case ColorProfileEnum.black:
                return DSColors.white;
            case ColorProfileEnum.grey:
                return DSColors.white;
            case ColorProfileEnum.white:
                return DSColors.black;
            case ColorProfileEnum.disable:
                return DSColors.disableGrey;
        }
    }

    Color getBorderColor() {
        switch(colorProfile) {
            case ColorProfileEnum.black:
                return DSColors.black;
            case ColorProfileEnum.grey:
                return DSColors.disableGrey;
            case ColorProfileEnum.white:
                return DSColors.black;
            case ColorProfileEnum.disable:
                return DSColors.disableGrey;
        }
    }
}
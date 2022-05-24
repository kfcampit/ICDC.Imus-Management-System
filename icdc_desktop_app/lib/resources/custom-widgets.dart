import 'package:flutter/material.dart';

ButtonTheme roundedButtons({
  double? start,
  double? top,
  double? end,
  double? bottom,
  required double height,
  required double width,
  required Color color,
  required String text,
  TextStyle? textStyle,
  required Function function,
  BuildContext? context,
  Widget? page,
}) {
  textStyle ??= const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Colors.white);

  start ??= 0;
  top ??= 0;
  end ??= 0;
  bottom ??= 0;

  return ButtonTheme(
    child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(start, top, end, bottom),
        child: Container(
          height: height,
          width: width,
          child: TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(16)),
                backgroundColor: MaterialStateProperty.all<Color>(color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: color)))),
            child: Text(text, textAlign: TextAlign.center, style: textStyle),
            onPressed: () {
              function(context, page);
            },
          ),
        )),
  );
}

ButtonTheme sideBarButtonIcon({
  required IconData iconName,
  String? hoverText,
  required Function function,
  BuildContext? context,
  Widget? page,
}) {
  return ButtonTheme(
      child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          child: IconButton(
            icon: Icon(
              iconName,
              color: Colors.white,
              size: 32,
            ),
            iconSize: 32,
            onPressed: () {
              function(context, page);
            },
          )));
}

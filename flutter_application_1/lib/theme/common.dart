import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';

Widget carryImageWidget(
    {required String url,
    BoxFit boxFit = BoxFit.fitHeight,
    double radius = 20}) {
  return Image.network(
    url,
    fit: boxFit,
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius), // Image border
          child: SizedBox.fromSize(
            child: child,
          ),
        );
      }
      return Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
        child: const Center(
          child: CupertinoActivityIndicator(
            color: kPrimaryColor,
          ),
        ),
      );
    },
  );
}

Widget flexibleText({
  required String text,
  Color textColor = kLightGreyFontColor,
  EdgeInsetsGeometry padding = const EdgeInsets.all(0),
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.normal,
  AlignmentGeometry alignment = Alignment.center,
  TextOverflow? overflow,
  String? fontFamily,
}) {
  return Padding(
    padding: padding,
    child: Align(
      alignment: alignment,
      child: Text(
        text,
        overflow: overflow,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: textColor,
          fontFamily: fontFamily,
        ),
      ),
    ),
  );
}

Widget customDivider() {
  return const Padding(
    padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
    child: Divider(
      height: 10,
      color: kLightGreyFontColor,
    ),
  );
}

Widget customCircularIndicator() {
  return const CupertinoActivityIndicator(
    color: kPrimaryColor,
  );
}

Widget circularIndicatorWidget({required double height}) {
  return SizedBox(
    height: height,
    child: Center(child: customCircularIndicator()),
  );
}

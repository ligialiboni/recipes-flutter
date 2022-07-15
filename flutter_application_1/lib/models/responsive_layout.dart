import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileChild;

  const ResponsiveLayout({Key? key, required this.mobileChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreyColor,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  Widget childWidget = mobileChild;
                  return childWidget;
                },
              ),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}

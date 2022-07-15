import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/pages/result_page.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: kDarkGreyColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: TextField(
            cursorColor: kPrimaryColor,
            style: TextStyle(color: kLightGreyFontColor),
            textInputAction: TextInputAction.go,
            onSubmitted: (value) async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    inputText: value,
                  ),
                ),
              );
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: kPrimaryColor,
              ),
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(fontSize: 18, color: kDarkGreyFontColor),
            ),
          ),
        ),
      ),
    );
  }
}

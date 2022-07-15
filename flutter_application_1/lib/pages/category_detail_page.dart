import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/widgets/card/recommend_card.dart';
import 'package:flutter_application_1/theme/common.dart';

class CategoryDetailPage extends StatelessWidget {
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;
  const CategoryDetailPage({
    Key? key,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          strCategory,
          style: const TextStyle(
              color: kLightGreyFontColor,
              fontFamily: 'Lato',
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: BackButton(color: kLightFontColor),
        ),
      ),
      body: ListView(
        children: [
          carryImageWidget(
            url: strCategoryThumb,
            boxFit: BoxFit.fill,
            radius: 0,
          ),
          const SizedBox(height: 10),
          flexibleText(
            text: strCategoryDescription,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w100,
            padding: const EdgeInsets.all(5),
            fontSize: 18,
          ),
          const SizedBox(height: 10),
          flexibleText(
            text: 'Related to $strCategory',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.topLeft,
          ),
          RecommendCardWidget(inputText: strCategory),
        ],
      ),
    );
  }
}

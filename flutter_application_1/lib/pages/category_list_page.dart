import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/widgets/list/meal_list.dart';

class CategoryListPage extends StatelessWidget {
  final List<Food> dataList;
  final String strCategory;
  const CategoryListPage({
    Key? key,
    required this.dataList,
    required this.strCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkColor,
        elevation: 0,
        title: Text(
          strCategory,
          style: const TextStyle(
            color: kPrimaryColor,
            fontFamily: 'Lato',
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: BackButton(color: kPrimaryColor),
        ),
      ),
      body: MealList(dataList: dataList),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/repository/services/api.dart';
import 'package:flutter_application_1/theme/common.dart';
import 'package:flutter_application_1/widgets/list/meal_list.dart';

class AreaDetailPage extends StatelessWidget {
  final String area;

  AreaDetailPage({
    Key? key,
    required this.area,
  }) : super(key: key);

  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          area,
          style: const TextStyle(
              color: kLightGreyFontColor,
              fontFamily: 'Lato',
              fontSize: 26,
              fontWeight: FontWeight.w700),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: BackButton(color: kLightGreyFontColor),
        ),
      ),
      body: FutureBuilder<Meal>(
        future: getMealDataByArea(area: area),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: customCircularIndicator());
          } else if (snapshot.data?.lists?.length == null) {
            return Center(
                child: flexibleText(
              text: 'No data',
              fontWeight: FontWeight.bold,
            ));
          }
          return MealList(
            dataList: snapshot.data!.lists!,
            categorVisible: false,
          );
        },
      ),
    );
  }
}

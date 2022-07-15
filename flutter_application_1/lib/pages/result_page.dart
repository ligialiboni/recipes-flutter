import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/repository/services/api.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class ResultPage extends StatelessWidget {
  final String inputText;
  const ResultPage({
    Key? key,
    required this.inputText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Result',
          style: TextStyle(
              color: kDarkGreyFontColor,
              fontFamily: 'Lato',
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: BackButton(color: kLightGreyFontColor),
        ),
      ),
      body: FutureBuilder<Meal>(
        future: getMealDataByInputText(inputText: inputText),
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
          return MealList(dataList: snapshot.data!.lists!);
        },
      ),
    );
  }
}

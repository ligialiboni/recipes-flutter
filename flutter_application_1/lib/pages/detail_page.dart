import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/repository/services/api.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Detail',
          style: TextStyle(
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
      body: FutureBuilder<Meal>(
        future: getMealDataById(id: id),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: customCircularIndicator());
          }
          final data = snapshot.data?.lists?[0];
          var id = int.parse(data?.idMeal ?? '');
          assert(id is int);

          return ListView(
            children: [
              carryImageWidget(
                url: data?.strMealThumb ?? '',
                boxFit: BoxFit.fill,
                radius: 0,
              ),
              flexibleText(
                text: data?.strMeal ?? '',
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
                fontSize: 24,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10, top: 20),
              ),
              BasicInfoWidget(
                mealId: id,
                mealData: data!,
              ),
              customDivider(),
              flexibleText(
                  text: 'Ingredients',
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 5, bottom: 10),
                  textColor: kLightFontColor),
              IngredientList(ingredients: data.ingredients!),
              customDivider(),
              flexibleText(
                text: 'Detail',
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                fontSize: 22,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 5, bottom: 10),
                textColor: kLightFontColor,
              ),
              flexibleText(
                text: data.strInstructions ?? 'No data',
                textColor: kDarkGreyFontColor,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w100,
                fontSize: 16,
                padding: const EdgeInsets.all(5),
              ),
            ],
          );
        },
      ),
    );
  }
}

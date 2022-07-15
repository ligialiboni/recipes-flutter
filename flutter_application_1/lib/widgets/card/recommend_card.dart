import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/pages/detail_page.dart';
import 'package:flutter_application_1/repository/services/api.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class RecommendCardWidget extends StatelessWidget {
  final String inputText;
  const RecommendCardWidget({
    Key? key,
    required this.inputText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Meal>(
      future: getMealDataByCategory(inputText: inputText),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: customCircularIndicator());
        }

        return SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: snapshot.data?.lists?.length ?? 0,
            controller: PageController(viewportFraction: 0.7),
            itemBuilder: (_, index) {
              final data = snapshot.data?.lists?[index];
              return Transform.scale(
                scale: 0.9,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          id: data?.idMeal ?? '',
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      carryImageWidget(
                          url: data?.strMealThumb ?? '', boxFit: BoxFit.cover),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            flexibleText(
                              text: data?.strMeal ?? '',
                              fontSize: 21,
                              textColor: kLightGreyFontColor,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

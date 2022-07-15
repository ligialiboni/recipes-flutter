import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/pages/detail_page.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class MealList extends StatelessWidget {
  final List<Food> dataList;
  final bool categorVisible;

  const MealList({
    Key? key,
    required this.dataList,
    this.categorVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 14),
      padding: const EdgeInsets.all(18),
      itemCount: dataList.length,
      itemBuilder: (_, index) {
        final data = dataList[index];
        return InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  id: data.idMeal ?? '',
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: 130,
            child: Row(
              children: <Widget>[
                SquareImage(url: data.strMealThumb ?? ''),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      flexibleText(
                        text: data.strMeal ?? '',
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                        alignment: Alignment.topLeft,
                        overflow: TextOverflow.ellipsis,
                      ),
                      categorVisible
                          ? flexibleText(
                              text: data.strCategory ?? '',
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              alignment: Alignment.topLeft,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

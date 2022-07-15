import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/pages/area_detail_page.dart';
import 'package:flutter_application_1/repository/services/api.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class AreaCardListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Meal>(
      future: getAreaList(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return circularIndicatorWidget(height: 85);
        }

        return SizedBox(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.lists?.length ?? 0,
            itemBuilder: (context, index) {
              final data = snapshot.data?.lists?[index];
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                width: 150,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AreaDetailPage(
                          area: data?.strArea ?? '',
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: kDarkGreyColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            flexibleText(
                              text: data?.strArea ?? '',
                              fontSize: 18,
                              textColor: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              alignment: Alignment.center,
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

import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/pages/category_detail_page.dart';
import 'package:flutter_application_1/repository/services/api.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class CategoryCardListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Category>(
      future: getCategoryData(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return circularIndicatorWidget(height: 200);
        }

        return Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.categories?.length ?? 0,
            itemBuilder: (context, index) {
              final data = snapshot.data?.categories?[index];
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetailPage(
                          strCategory: data?.strCategory ?? '',
                          strCategoryThumb: data?.strCategoryThumb ?? '',
                          strCategoryDescription:
                              data?.strCategoryDescription ?? '',
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      carryImageWidget(url: data?.strCategoryThumb ?? ''),
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
                              text: data?.strCategory ?? '',
                              fontSize: 20,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              textColor: kLightGreyFontColor,
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

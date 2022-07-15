import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/repository/providers/providers.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

import 'package:provider/provider.dart';

class BookmarkButton extends StatelessWidget {
  final int id;
  final Food? data;

  const BookmarkButton({
    Key? key,
    required this.id,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseHelper>(context);
    return FutureBuilder<bool>(
      future: provider.test(id),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: customCircularIndicator());
        }
        if (snapshot.data == true) {
          return IconButton(
            onPressed: () {
              provider.deleteBookmark(id);
            },
            icon: Image.asset(
              'assets/icons/love.png',
              color: kRedColor,
            ),
          );
        }
        return IconButton(
          onPressed: () {
            provider.insertBookmark([
              Bookmark(
                id: id,
                url: data?.strMealThumb ?? '',
                name: data?.strMeal ?? '',
              )
            ]);
          },
          icon: Image.asset(
            'assets/icons/love.png',
            color: kLightFontColor,
          ),
        );
      },
    );
  }
}

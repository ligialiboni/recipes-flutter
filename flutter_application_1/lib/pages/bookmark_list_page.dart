import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/models/bookmark.dart';
import 'package:flutter_application_1/repository/providers/db_helper.dart';
import 'package:flutter_application_1/theme/common.dart';
import 'package:flutter_application_1/widgets/list/bookmark_list.dart';
import 'package:provider/provider.dart';

class BookmarkListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseHelper>(context);

    return Column(
      children: [
        const SizedBox(height: 60),
        flexibleText(
            text: 'Favorites',
            fontSize: 40,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.topLeft,
            textColor: kPrimaryColor),
        Expanded(
          child: FutureBuilder(
            future: provider.retrieveBookmark(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Bookmark>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: customCircularIndicator());
              } else if (snapshot.data?.length == 0) {
                return Center(
                    child: flexibleText(
                  text: 'No Favorites',
                  fontWeight: FontWeight.bold,
                ));
              }
              return BookmarkList(
                dbHelper: provider,
                snapshot: snapshot,
              );
            },
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/bookmark.dart';
import 'package:flutter_application_1/pages/detail_page.dart';
import 'package:flutter_application_1/repository/providers/db_helper.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class BookmarkList extends StatelessWidget {
  final AsyncSnapshot<List<Bookmark>> snapshot;
  final DatabaseHelper dbHelper;

  const BookmarkList({
    Key? key,
    required this.snapshot,
    required this.dbHelper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 14),
      padding: const EdgeInsets.all(18),
      itemCount: snapshot.data?.length ?? 0,
      itemBuilder: (_, index) {
        var data = snapshot.data?[index];
        return Dismissible(
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
          ),
          key: ValueKey<int>(snapshot.data![index].id),
          onDismissed: (DismissDirection direction) async {
            await dbHelper.deleteBookmark(snapshot.data![index].id);
          },
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    id: data?.id.toString() ?? '',
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
                  SquareImage(url: data?.url ?? ''),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        flexibleText(
                          text: data?.name ?? '',
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          alignment: Alignment.topLeft,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

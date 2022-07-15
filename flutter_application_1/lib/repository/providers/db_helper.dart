import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/models/bookmark.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper extends ChangeNotifier {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'book.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE bookmark(id INTEGER PRIMARY KEY, url TEXT, name TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertBookmark(List<Bookmark> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('bookmark', user.toMap());
    }

    notifyListeners();
    return result;
  }

  Future<List<Bookmark>> retrieveBookmark() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('bookmark');

    return List.generate(queryResult.length, (i) {
      return Bookmark(
        id: queryResult[i]['id'],
        name: queryResult[i]['name'],
        url: queryResult[i]['url'],
      );
    });
  }

  Future<void> deleteBookmark(int id) async {
    final db = await initializeDB();
    await db.delete(
      'bookmark',
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
  }

  Future<void> deleteAllBookmark() async {
    final db = await initializeDB();
    await db.delete('bookmark');
    notifyListeners();
  }

  Future<bool> test(int id) async {
    final db = await initializeDB();
    var result = await db.rawQuery(
      'SELECT EXISTS(SELECT 1 FROM bookmark WHERE id=$id)',
    );
    int? exists = Sqflite.firstIntValue(result);
    return exists == 1;
  }
}

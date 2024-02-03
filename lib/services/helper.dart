import 'dart:io' as io;
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:hadith/models/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'hadith_bn_test.db');

    bool dbExists = await io.File(path).exists();
    if (!dbExists) {
      ByteData data =
          await rootBundle.load(join("assets/database", "hadith_bn_test.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await io.File(path).writeAsBytes(bytes, flush: true);
    }
    var theDb = await openDatabase(path, version: 1);
    return theDb;
  }

  Future<List<Books>> getBooks() async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM books');
    List<Books> books = [];

    for (int i = 0; i < list.length; i++) {
      books.add(Books(
          list[i]['id'],
          list[i]['title'],
          list[i]['title_ar'],
          list[i]['number_of_hadis'],
          list[i]['abvr_code'],
          list[i]['book_name'],
          list[i]['book_descr'],
          list[i]['color_code']));
    }
    // print(books.length);
    // for (int i = 0; i < books.length; i++) {
    //   print("${books[i].id} ${books[i].title} ${books[i].number_of_hadis}");
    // }

    return books;
  }
  Future<List<Chapters>> getChapters() async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM chapter');
    List<Chapters> chapters = [];

    for (int i = 0; i < list.length; i++) {
      chapters.add(Chapters(
          list[i]['id'],
          list[i]['chapter_id'],
          list[i]['book_id'],
          list[i]['book_name'],
          list[i]['title'],
          list[i]['hadis_range'],
          list[i]['number']));
    }

    return chapters;
  }
}

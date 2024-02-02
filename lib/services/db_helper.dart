import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  Future initdb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'hadith_bn_test.db'); // given database file name

    final exist = await databaseExists(
        path); // return true if database exists otherwise false

    if (exist) {
      print("Database already exists");
      print(path);
      await openDatabase(path);
    } else {
      //creating a copy of the database from asset
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data =
          await rootBundle.load(join("assets/database/", "hadith_bn_test.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      print("Database loaded successfully");
    }
    await openDatabase(path);
  }
}

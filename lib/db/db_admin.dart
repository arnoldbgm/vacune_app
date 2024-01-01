import 'dart:io';

import 'package:flutter_vacuna/models/licens_models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;
  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  Future<Database> getDataBase() async {
    if (myDatabase != null) return myDatabase!;
    myDatabase = await initDB();
    return myDatabase!;
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "LicenseDB.db");
    return openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE LICENSE(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, dni TEXT, url TEXT)",
        );
      },
    );
  }

  Future<int> insertLicense(LicenseModel model) async {
    final db = await getDataBase();
    int res = await db!.insert("LICENSE", model.toJson());
    return res;
  }

  Future getData() async {
    final db = await getDataBase();
    List res = await db!.rawQuery("SELECT * FROM LICENSE");
    print(res);
    return res;
  }

  Future<List<LicenseModel>> getDataLicense() async {
    List<LicenseModel> data = [];
    final Database? db = await getDataBase();
    List res = await db!.rawQuery("SELECT * FROM LICENSE");
    data = res.map<LicenseModel>((e) => LicenseModel.FromJson(e)).toList();
    return data;
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:list_supermarkert/data/product_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'product.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ProductDao.tableSql);
    },
    version: 1,
  );
}

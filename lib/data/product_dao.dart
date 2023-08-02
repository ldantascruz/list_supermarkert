import 'dart:developer';

import 'package:list_supermarkert/data/database.dart';
import 'package:list_supermarkert/screens/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name  TEXT, '
      '$_quantity INTEGER, '
      '$_unityValue REAL)';

  static const String _tablename = 'productTable';
  static const String _name = 'name';
  static const String _quantity = 'quantity';
  static const String _unityValue = 'unityValue';

  save(Product product) async {
    log('Estamos acessando o save: ');
    final Database db = await getDatabase();
    var itemExists = await find(product.name);
    Map<String, dynamic> productMap = toMap(product);
    if (itemExists.isEmpty) {
      log('Produto não existia: $itemExists');
      return await db.insert(_tablename, productMap);
    } else {
      log('Produto já existia: $itemExists');
      return await db.update(
        _tablename,
        productMap,
        where: '$_name = ?',
        whereArgs: [product.name],
      );
    }
  }

  Map<String, dynamic> toMap(Product product) {
    log('Convertendo to map: ');
    final Map<String, dynamic> productMap = {};
    productMap[_name] = product.name;
    productMap[_quantity] = product.quantity;
    productMap[_unityValue] = product.unityValue;
    log('Map convertido: $productMap');
    return productMap;
  }

  Future<List<Product>> findAll() async {
    log('Estamos acessando o findAll: ');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    log('Procurando dados no banco de dados... ');
    log('encontrado: $result');
    return toList(result);
  }

  List<Product> toList(List<Map<String, dynamic>> productMap) {
    log('Convertendo to list: ');
    final List<Product> products = [];
    for (Map<String, dynamic> row in productMap) {
      final Product product = Product(
        name: row[_name],
        quantity: row[_quantity],
        unityValue: row[_unityValue],
      );
      products.add(product);
    }
    log('Lista convertida: $products');
    return products;
  }

  Future<List<Product>> find(String productName) async {
    log('Estamos acessando o find: ');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [productName],
    );
    log('Produto encontrado: ${toList(result)}');
    return toList(result);
  }

  delete(String productName) async {
    log('Estamos acessando o delete: ');
    final Database db = await getDatabase();
    return await db.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [productName],
    );
  }
}

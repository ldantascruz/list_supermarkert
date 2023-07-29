import 'package:list_supermarkert/screens/product.dart';

class ProductDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name  TEXT, '
      '$_quantity INTEGER, '
      '$_unityValue REAL)';

  static const String _tablename = 'productTable';
  static const String _name = 'name';
  static const String _quantity = 'quantity';
  static const String _unityValue = 'unityValue';

  save(Product product) async {}

  Future<List<Product>> findAll() async {}

  Future<List<Product>> find(String productName) async {}

  delete(String productName) async {}
}

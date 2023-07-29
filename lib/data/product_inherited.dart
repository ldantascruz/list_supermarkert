import 'package:flutter/material.dart';
import 'package:list_supermarkert/screens/product.dart';

class ProductInherited extends InheritedWidget {
  ProductInherited({super.key, required super.child});

  final List<Product> productList = [];

  void newProduct({
    required String name,
    required int quantity,
    required double unityValue,
  }) {
    productList.add(
      Product(name: name, quantity: quantity, unityValue: unityValue),
    );
  }

  static ProductInherited of(BuildContext context) {
    final ProductInherited? result =
        context.dependOnInheritedWidgetOfExactType<ProductInherited>();
    assert(result != null, 'No ProductInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProductInherited oldWidget) {
    return oldWidget.productList.length != productList.length;
  }
}

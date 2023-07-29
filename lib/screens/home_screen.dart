import 'package:flutter/material.dart';
import 'package:list_supermarkert/screens/add_product_screen.dart';
import 'package:list_supermarkert/data/product_inherited.dart';
import 'package:list_supermarkert/screens/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: ProductInherited.of(context).productList,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Adicionar Produto'),
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) =>
                  AddProductScreen(productContext: context),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

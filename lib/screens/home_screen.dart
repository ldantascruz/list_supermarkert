import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:list_supermarkert/data/product_dao.dart';
import 'package:list_supermarkert/screens/add_product_screen.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          child: FutureBuilder<List<Product>>(
            future: ProductDao().findAll(),
            builder: (context, snapshot) {
              List<Product>? products = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando produtos...'),
                      ],
                    ),
                  );
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando produtos...'),
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando produtos...'),
                      ],
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData && products != null) {
                    if (products.isNotEmpty) {
                      return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final Product product = products[index];
                          return product;
                        },
                      );
                    }
                    return const Center(
                      child: Column(
                        children: [
                          Icon(Icons.error_outline, size: 128),
                          Text(
                            'Nenhum produto cadastrado',
                            style: TextStyle(fontSize: 32),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 128),
                        Text(
                          'Erro ao carregar produtos',
                          style: TextStyle(fontSize: 32),
                        ),
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => AddProductScreen(
                productContext: context,
              ),
            ),
          ).then((value) => setState(() {
                log('RECARREGANDO LISTA');
              }));
        },
        label: const Text('Adicionar Produto'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:list_supermarkert/data/product_inherited.dart';
import 'package:list_supermarkert/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Lista de Compras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepOrange,
      ),
      home: ProductInherited(child: const HomeScreen()),
    );
  }
}

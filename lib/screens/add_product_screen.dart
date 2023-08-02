// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:list_supermarkert/data/product_dao.dart';
import 'package:list_supermarkert/screens/product.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({
    Key? key,
    required this.productContext,
  }) : super(key: key);

  final BuildContext productContext;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) =>
      value != null && value.isEmpty ? false : true;

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unityValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Produto'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: nameController,
                validator: (value) =>
                    valueValidator(value) ? null : 'Insira o nome do produto',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome do Produto',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 170,
                  child: TextFormField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Quantidade',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 170,
                  child: TextFormField(
                    controller: unityValueController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      prefix: Text('R\$'),
                      border: OutlineInputBorder(),
                      labelText: 'Preço',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ProductDao().save(Product(
                        name: nameController.text,
                        quantity: int.parse(quantityController.text),
                        unityValue: double.parse(unityValueController.text)));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Criando um novo produto'),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Adicionar'),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

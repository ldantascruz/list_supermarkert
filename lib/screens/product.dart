// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  final String name;
  final int quantity;
  final double unityValue;

  const Product({
    Key? key,
    required this.name,
    required this.quantity,
    required this.unityValue,
  }) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.quantity > 0 ? widget.quantity - 1 : widget.quantity;
              });
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              side: const BorderSide(
                width: 1,
                color: Colors.deepPurpleAccent,
              ),
            ),
            child: const Icon(Icons.remove),
          ),
          Text(widget.quantity.toString()),
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.quantity + 1;
              });
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              side: const BorderSide(
                width: 1,
                color: Colors.deepPurpleAccent,
              ),
            ),
            child: const Icon(Icons.add),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              widget.unityValue.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

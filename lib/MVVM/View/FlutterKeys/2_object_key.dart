import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ObjectKeyScreen extends StatefulWidget {
  const ObjectKeyScreen({super.key});

  @override
  State<ObjectKeyScreen> createState() => _ObjectKeyScreenState();
}

class _ObjectKeyScreenState extends State<ObjectKeyScreen> {
  List<Product> cartItems = [
    Product(id: 'p1', name: 'Apple'),
    Product(id: 'p2', name: 'Banana'),
    Product(id: 'p3', name: 'Carrot'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: cartItems.map((item) {
          return ListTile(
            key: ValueKey(item.id),
            title: Text(item.name),
          );
        }).toList(),
      ),
    );
  }
}

class Product {
  final String id;
  final String name;
  Product({required this.id, required this.name});
}

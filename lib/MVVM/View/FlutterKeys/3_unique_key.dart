import 'package:flutter/material.dart'; 

class UniqueKeyScreen extends StatefulWidget {
  const UniqueKeyScreen({super.key});

  @override
  State<UniqueKeyScreen> createState() => _UniqueKeyScreenState();
}

class _UniqueKeyScreenState extends State<UniqueKeyScreen> {
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

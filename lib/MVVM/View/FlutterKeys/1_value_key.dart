import 'dart:developer';

import 'package:flutter/material.dart';

class VlaueKeyScreen extends StatefulWidget {
  const VlaueKeyScreen({super.key});

  @override
  State<VlaueKeyScreen> createState() => _VlaueKeyScreenState();
}

class _VlaueKeyScreenState extends State<VlaueKeyScreen> {
  List<Product> cartItems = [
    Product(id: 'p1', name: 'Apple'),
    Product(id: 'p2', name: 'Banana'),
    Product(id: 'p3', name: 'Carrot'),
    Product(id: 'p4', name: 'Dates'),
    Product(id: 'p5', name: 'Eggplant'),
    Product(id: 'p6', name: 'Fig'),
    Product(id: 'p7', name: 'Grapes'),
    Product(id: 'p8', name: 'Honeydew'),
    Product(id: 'p9', name: 'Iceberg Lettuce'),
    Product(id: 'p10', name: 'Jackfruit'),
    Product(id: 'p11', name: 'Kiwi'),
    Product(id: 'p12', name: 'Lemon'),
    Product(id: 'p13', name: 'Mango'),
    Product(id: 'p14', name: 'Nectarine'),
    Product(id: 'p15', name: 'Orange'),
    Product(id: 'p16', name: 'Papaya'),
    Product(id: 'p17', name: 'Quince'),
    Product(id: 'p18', name: 'Raspberry'),
    Product(id: 'p19', name: 'Strawberry'),
    Product(id: 'p20', name: 'Tomato'),
    Product(id: 'p21', name: 'Ugli Fruit'),
    Product(id: 'p22', name: 'Vanilla Bean'),
    Product(id: 'p23', name: 'Watermelon'),
    Product(id: 'p24', name: 'Xigua'),
    Product(id: 'p25', name: 'Yam'),
    Product(id: 'p26', name: 'Zucchini'),
    Product(id: 'p27', name: 'Pineapple'),
    Product(id: 'p28', name: 'Blueberry'),
  ];

  List<String> delete = [];
  bool isSelectedEnable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Visibility(
              // visible: delete.isNotEmpty,
              visible: isSelectedEnable,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                child: InkWell(
                  onTap: delete.length == cartItems.length
                      ? () {
                          setState(() {
                            // delete.length == cartItems.length
                            delete.clear();
                          });
                        }
                      : () {
                          setState(() {
                            for (Product i in cartItems) {
                              if (!delete.contains(i.id)) {
                                delete.add(i.id);
                              }
                            }
                          });
                        },
                  child: Row(
                    children: [
                      const Text(
                        "Select All",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 20),
                      delete.length != cartItems.length
                          ? const Icon(Icons.check_box_outline_blank_outlined)
                          : const Icon(Icons.check_box)
                    ],
                  ),
                ),
              )),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: cartItems.map((item) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: .5, color: Colors.grey.withOpacity(0.5))),
                  child: ListTile(
                    key: ValueKey(item.id),
                    onLongPress: () {
                      isSelectedEnable = true;
                      if (delete.contains(item.id)) {
                        delete.remove(item.id);
                      } else {
                        delete.add(item.id);
                      }
                      setState(() {});
                    },
                    onTap: delete.isEmpty && !isSelectedEnable
                        ? null
                        : () {
                            if (delete.contains(item.id)) {
                              delete.remove(item.id);
                              delete.isEmpty ? isSelectedEnable = false : true;
                            } else {
                              delete.add(item.id);
                            }
                            setState(() {});
                          },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.name),
                        Visibility(
                          visible: delete.contains(item.id),
                          child: const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: delete.isNotEmpty,
        child: FloatingActionButton(
            elevation: 1,
            backgroundColor: Colors.red.withOpacity(0.3),
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                cartItems.removeWhere((item) => delete.contains(item.id));

                log("cartItems : $cartItems");
              });
            }),
      ),
    );
  }
}

class Product {
  final String id;
  final String name;
  Product({required this.id, required this.name});
}

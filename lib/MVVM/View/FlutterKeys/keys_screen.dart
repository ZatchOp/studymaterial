import 'package:chatapp/MVVM/View/FlutterKeys/1_value_key.dart';
import 'package:chatapp/MVVM/View/FlutterKeys/2_object_key.dart';
import 'package:chatapp/MVVM/View/FlutterKeys/3_unique_key.dart';
import 'package:chatapp/MVVM/View/FlutterKeys/4_global_key.dart';
import 'package:flutter/material.dart';

class KeysScreen extends StatefulWidget {
  const KeysScreen({super.key});

  @override
  State<KeysScreen> createState() => _KeysScreenState();
}

class _KeysScreenState extends State<KeysScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Text("Value Key")),
              Tab(icon: Text("Object Key")),
              Tab(icon: Text("Unique Key")),
              Tab(icon: Text("Global Key")),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            VlaueKeyScreen(),
            ObjectKeyScreen(),
            UniqueKeyScreen(),
            GlobalKeyScreen()
          ],
        ),
      ),
    );
  }
}

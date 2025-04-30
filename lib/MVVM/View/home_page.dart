import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _randomint = 0;
  double scrollOffset = 0.0;
  int getRandomNumber() {
    int tempNum = 0;

    tempNum = Random().nextInt(999);
    return tempNum;
  }

  final ScrollController _scrollController = ScrollController();
  bool _isAppBarExpanded = true;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
      });
      bool isExpanded = _scrollController.hasClients &&
          _scrollController.offset < (200 - kToolbarHeight);

      if (isExpanded != _isAppBarExpanded) {
        setState(() {
          _isAppBarExpanded = isExpanded;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://picsum.photos/seed/${selectedIndex ?? _randomint}/300/200",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return GridTile(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              "https://picsum.photos/seed/$index/300/300",
                              fit: BoxFit.cover,
                            ),
                            if (selectedIndex == index)
                              const Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              selectedIndex = null;
              _randomint = getRandomNumber();
            });
          }),
    );
  }
}

import 'package:chatapp/MVVM/View/ParallaxEffects/parallax_model.dart';
import 'package:flutter/material.dart';

class ParallaxScreen extends StatefulWidget {
  const ParallaxScreen({super.key});

  @override
  State<ParallaxScreen> createState() => _ParallaxScreenState();
}

int _currectpage = 10000;

class _ParallaxScreenState extends State<ParallaxScreen> {
  final PageController _pageController = PageController(
    viewportFraction: 0.8,
    initialPage: _currectpage,
  );

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _pageController.viewportFraction.isInfinite;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                _currectpage = value;
              });
            },
            controller: _pageController,
            itemCount: 15,
            itemBuilder: (context, index) {
              return Container(
                margin: _currectpage == index
                    ? const EdgeInsets.symmetric(horizontal: 16, vertical: 32)
                    : const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32 - 16),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 6))
                ]),
                child: ParllaxModel(
                  imageUrl: "https://picsum.photos/seed/${index + 1}/300/300",
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

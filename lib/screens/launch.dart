import 'package:app/utilities/palette.dart';
import 'package:app/utilities/text_generator.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  List<Widget> _pages = [
    Container(
      padding: const EdgeInsets.all(9.0),
      height: double.infinity,
      color: Palette.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        title("Reuse"),
        subtitle("Find reusable items and make them."),
        SizedBox(height: 10.0),
        Placeholder()
      ]),
    ),
    Container(
      padding: const EdgeInsets.all(9.0),
      color: Palette.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        title("Recovery"),
        subtitle("Find and use the climate community."),
        SizedBox(height: 10.0),
        Placeholder()
      ]),
    ),
    Container(
      padding: const EdgeInsets.all(9.0),
      color: Palette.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        title("Recycle"),
        subtitle("Find out what you can recycle."),
        SizedBox(height: 10.0),
        Placeholder(),
        ElevatedButton(onPressed: () {}, child: Text("Okay!"))
      ]),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        body: Stack(children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _pageController,
            children: _pages,
          ),
          Positioned(
            bottom: 215.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => _buildPageIndicator(index),
              ),
            ),
          ),
        ]),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Palette.white,
        ));
  }

  Widget _buildPageIndicator(int index) {
    bool isCurrentIndex = index == _currentIndex;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9.0),
      width: isCurrentIndex ? 25.0 : 17.0,
      height: isCurrentIndex ? 9.0 : 7.0,
      decoration: BoxDecoration(
        color: isCurrentIndex ? Palette.sapphire : Palette.deepsliver,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

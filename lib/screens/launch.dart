import 'package:flutter/material.dart';
import 'package:app/utilities/palette.dart';
import 'package:app/utilities/text_generator.dart';
import 'package:app/widgets/next_button.dart';
import 'package:app/utilities/constants.dart';

class LaunchScreen extends StatefulWidget {
  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with SingleTickerProviderStateMixin {
  Animation<double>? _linearAnimation;
  AnimationController? _linearAnimationController;
  PageController _pageController = PageController();
  int _currentIndex = 0;
  List<Widget> _pages = [
    Container(
      padding: EdgeInsets.all(Spacing.small),
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
      padding: const EdgeInsets.all(Spacing.small),
      color: Palette.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        title("Recovery"),
        subtitle("Find and use the climate community."),
        SizedBox(height: 10.0),
        Placeholder()
      ]),
    ),
    Container(
      padding: const EdgeInsets.all(Spacing.small),
      color: Palette.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        title("Recycle"),
        subtitle("Find out what you can recycle."),
        SizedBox(height: 10.0),
        Placeholder(),
      ]),
    ),
  ];

  @override
  void initState() {
    super.initState();

    //Animation Controller
    _linearAnimationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    //Defind Animation
    _linearAnimation =
        Tween(begin: begin, end: end).animate(_linearAnimationController!);

    _setLinearAnimation(0, 1);
  }

  double step = 0.0;
  double begin = 0.0;
  double end = 0.0;
  int total = 3;

  _setLinearAnimation(double max, int currentIndex) {
    setState(() {
      step = max / total;
      begin = step * (currentIndex - 1);
      end = step * currentIndex;

      _linearAnimation = Tween<double>(begin: begin, end: end)
          .animate(_linearAnimationController!);
    });

    _linearAnimationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Palette.white,
        body: Stack(children: [
          PageView(
            onPageChanged: (index) {
              _linearAnimationController?.reset();
              _setLinearAnimation(maxWidth, index + 1);
              /*
              setState(() {
                _currentIndex = index;
              });
              */
            },
            //controller: _pageController,
            children: _pages,
          ),
          Positioned(
              child: Container(
            height: 7.0,
            width: double.infinity,
            decoration: BoxDecoration(color: Palette.sliver),
          )),
          Positioned(
              child: Container(
            height: 7.0,
            width: 50.0,
            decoration: BoxDecoration(color: Palette.sapphire),
          )),
          NextButton(onPressed: () {})
        ]),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Palette.white,
          actions: <Widget>[
            TextButton(onPressed: () {}, child: const Text("Skip"))
          ],
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
/*
class PageLinearIndicator extends AnimatedWidget {
  PageLinearIndicator({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Listenable animation;
    return Container(
      width: animation,
      decoration: BoxDecoration(color: Palette.sapphire),
    );
  }
}*/

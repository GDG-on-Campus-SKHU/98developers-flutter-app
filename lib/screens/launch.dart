import 'package:app/widgets/light_appbar.dart';
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
  final PageController _pageController = PageController(initialPage: 0);
  double _currentIndex = 0;
  bool _showContinueButton = false;
  late AnimationController _animationController;
  late Animation<double> _smoothLinearAnimation;

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

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _smoothLinearAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);

    _pageController.addListener(() {
      if (_pageController.position.isScrollingNotifier.value) {
        if (_pageController.position.axis == Axis.horizontal) {
          _animationController.animateTo(_pageController.offset /
              _pageController.position.maxScrollExtent);
        } else {
          _animationController.animateTo(
              _pageController.page! / _pageController.position.maxScrollExtent);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        body: Stack(children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index.toDouble();
                _showContinueButton = _currentIndex == 2;
              });
            },
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            children: _pages,
          ),
          Positioned(
              child: AnimatedBuilder(
            animation: _smoothLinearAnimation,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _smoothLinearAnimation.value,
                valueColor: AlwaysStoppedAnimation<Color>(Palette.sapphire),
                minHeight: 5.0,
              );
            },
          )),
          Positioned(
              left: 150.0,
              bottom: 100.0,
              child: Row(
                children: [
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: _showContinueButton ? 1.0 : 0.0,
                    child: _showContinueButton
                        ? ContinueButton(
                            onPressed: () {},
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                  color: Palette.white,
                                  fontFamily: "NotoSans",
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w500),
                            ))
                        : SizedBox.shrink(),
                  ),
                  if (_currentIndex < 2 && !_showContinueButton)
                    NextButton(onPressed: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    })
                ],
              )),
        ]),
        appBar: LightAppBar(
          actions: <Widget>[
            SkipButton(
              onPressed: () {},
              child: const Text("Skip"),
            )
          ],
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}

class SkipButton extends StatelessWidget {
  SkipButton({Key? key, required this.onPressed, required this.child});

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: child,
        style: TextButton.styleFrom(
          elevation: 0,
          foregroundColor: Palette.darkgrey,
        ));
  }
}

class ContinueButton extends StatelessWidget {
  ContinueButton({Key? key, required this.onPressed, required this.child});

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: child,
      fillColor: Palette.sapphire,
      constraints: BoxConstraints(minHeight: 55.0, minWidth: 90.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}

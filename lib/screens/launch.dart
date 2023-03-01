import 'package:flutter/material.dart';
import 'package:zikiza/utilities/typografie.dart';
import 'package:zikiza/utilities/constants.dart';
import 'package:zikiza/widgets/light_appbar.dart';
import 'package:zikiza/widgets/next_button.dart';

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
  Widget build(BuildContext _) {
    final dynamicColor = Theme.of(_).colorScheme;
    List<Widget> _pages = [
      Container(
        padding: EdgeInsets.all(Spacing.small),
        height: double.infinity,
        color: dynamicColor.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Typografie().DisplayMedium("Challenge", dynamicColor.onPrimary),
            SizedBox(height: 10.0),
            Typografie().LabelMedium("Select a challenge. Then also Enroll.",
                dynamicColor.onPrimary),
            SizedBox(height: 10.0),
            Placeholder()
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(Spacing.small),
        color: dynamicColor.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Typografie().DisplayMedium("Reward", dynamicColor.onPrimary),
            SizedBox(height: 10.0),
            Typografie().LabelMedium("Submit all submissions and earn rewards.",
                dynamicColor.onPrimary),
            SizedBox(height: 10.0),
            Placeholder()
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(Spacing.small),
        color: dynamicColor.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Typografie().DisplayMedium("Explore", dynamicColor.onPrimary),
            SizedBox(height: 10.0),
            Typografie().LabelMedium(
                "Find Climate community with Maps", dynamicColor.onPrimary),
            SizedBox(height: 10.0),
            Placeholder(),
          ],
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: dynamicColor.primary,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(
                () {
                  _currentIndex = index.toDouble();
                  _showContinueButton = _currentIndex == 2;
                },
              );
            },
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            children: _pages,
          ),
          Positioned(
            child: AnimatedBuilder(
              animation: _smoothLinearAnimation,
              builder: (_, child) {
                return LinearProgressIndicator(
                  value: _smoothLinearAnimation.value,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(dynamicColor.background),
                  minHeight: 5.0,
                );
              },
            ),
          ),
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
                          child: Typografie().BodyLarge(
                            "Continue",
                            dynamicColor.onPrimaryContainer,
                          ),
                          color: dynamicColor.primaryContainer,
                        )
                      : SizedBox.shrink(),
                ),
                if (_currentIndex < 2 && !_showContinueButton)
                  NextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    color: dynamicColor.onPrimaryContainer,
                    fillColor: dynamicColor.primaryContainer,
                  )
              ],
            ),
          ),
        ],
      ),
      appBar: LightAppBar(
        actions: <Widget>[
          SkipButton(
            onPressed: () {},
            child: const Text("Skip"),
            foregroundColor: dynamicColor.onPrimary,
          ),
        ],
        title: const Text(""),
        color: dynamicColor.primary,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}

class SkipButton extends StatelessWidget {
  SkipButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.foregroundColor,
  });

  final VoidCallback onPressed;
  final Widget child;
  final Color foregroundColor;

  @override
  Widget build(BuildContext _) {
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: TextButton.styleFrom(
        elevation: 0,
        foregroundColor: foregroundColor,
        textStyle: TextStyle(fontFamily: "NotoSans", fontSize: 15),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  ContinueButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.color,
  });

  final VoidCallback? onPressed;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: child,
      fillColor: color,
      constraints: BoxConstraints(minHeight: 55.0, minWidth: 90.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}

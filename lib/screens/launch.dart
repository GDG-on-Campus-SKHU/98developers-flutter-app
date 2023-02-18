import 'package:app/utilities/palette.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Palette.white,
        body: PageView(
          children: <Widget>[
            SizedBox.expand(
              child: Container(
                width: _width * 0.8,
                height: double.infinity,
                color: Palette.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Reuse",
                        style: TextStyle(
                            color: Palette.sapphire,
                            fontSize: 35,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Find reusable items and make them.",
                        style: TextStyle(
                          color: Palette.jetblack,
                          fontSize: 19,
                        ),
                      )
                    ]),
              ),
            ),
            SizedBox.expand(
              child: Container(
                color: Palette.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recovery",
                        style: TextStyle(
                            color: Palette.sapphire,
                            fontSize: 35,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Find and use the climate community.",
                        style: TextStyle(
                          color: Palette.jetblack,
                          fontSize: 19,
                        ),
                      )
                    ]),
              ),
            ),
            SizedBox.expand(
              child: Container(
                color: Palette.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recycle",
                        style: TextStyle(
                            color: Palette.sapphire,
                            fontSize: 35,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Find out what you can recycle.",
                        style: TextStyle(
                          color: Palette.jetblack,
                          fontSize: 19,
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
        appBar: AppBar());
  }
}

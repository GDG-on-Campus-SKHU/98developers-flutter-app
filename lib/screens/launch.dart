import 'package:app/utilities/palette.dart';
import 'package:app/utilities/text_generator.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  final _crossAxisStart = CrossAxisAlignment.start;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        body: PageView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(9.0),
              height: double.infinity,
              color: Palette.white,
              child: Column(crossAxisAlignment: _crossAxisStart, children: [
                title("Reuse"),
                subtitle("Find reusable items and make them."),
                SizedBox(height: 10.0),
                Placeholder()
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(9.0),
              color: Palette.white,
              child: Column(crossAxisAlignment: _crossAxisStart, children: [
                title("Recovery"),
                subtitle("Find and use the climate community."),
                SizedBox(height: 10.0),
                Placeholder()
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(9.0),
              color: Palette.white,
              child: Column(crossAxisAlignment: _crossAxisStart, children: [
                title("Recycle"),
                subtitle("Find out what you can recycle."),
                SizedBox(height: 10.0),
                Placeholder(),
                ElevatedButton(onPressed: () {}, child: Text("Okay!"))
              ]),
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Palette.white,
        ));
  }
}

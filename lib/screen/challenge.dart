import 'package:flutter/material.dart';
import '../utilities/palette.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  List<String> nowTitle = [
    'Do not use disposable items',
    'Walk on the wanted position',
    'Visiting recycling Club'
  ];
  List<String> exportTitle = [
    'Visiting recycling Club',
  ];
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.white,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: _width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'NOW',
                style: TextStyle(
                    fontSize: 25,
                    color: Palette.jetblack,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          SizedBox(
            height: 36,
          ),
          Container(
            //now listview
            width: _width * 0.9,
            height: _height * 0.3,
            child: ListView.builder(
                itemCount: nowTitle.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: _width * 0.9,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: _width * 0.78,
                              alignment: Alignment.topLeft,
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Palette.grapefruit),
                                child: Text(
                                  '7days',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Palette.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: _width * 0.78,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                nowTitle[index],
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: Palette.babyblue),
                              ),
                            ),
                            Container(
                              width: _width * 0.78,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Palette.grey,
                                    size: 13,
                                  ),
                                  Text(
                                    '379 joined',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Palette.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                            child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Palette.darkgrey,
                          ),
                          onPressed: () {},
                        ))
                      ],
                    ),
                  );
                }),
          ),
          Container(
            width: _width,
            height: _height * 0.1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'EXPORT',
                style: TextStyle(
                    fontSize: 25,
                    color: Palette.jetblack,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Container(
            //now listview
            width: _width * 0.9,
            height: _height * 0.3,
            child: ListView.builder(
                itemCount: exportTitle.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: _width * 0.9,
                    height: 80,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: _width * 0.78,
                              alignment: Alignment.topLeft,
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Palette.darkgrey),
                                child: Text(
                                  '7days',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Palette.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: _width * 0.78,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                exportTitle[index],
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: Palette.babyblue),
                              ),
                            ),
                            Container(
                              width: _width * 0.78,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Palette.grey,
                                    size: 13,
                                  ),
                                  Text(
                                    '379 added',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Palette.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                            child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Palette.darkgrey,
                          ),
                          onPressed: () {},
                        ))
                      ],
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}

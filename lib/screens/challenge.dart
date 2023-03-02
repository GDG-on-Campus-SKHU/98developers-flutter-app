import 'package:flutter/material.dart';
import '../utilities/palette.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  List<String> nowTitle = [
    'Eating home-cooked food',
    'picking up a certain amount of street trash '
  ];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final dynamicColor = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: dynamicColor.surfaceVariant,
        title: Container(
          width: _width,
          child: Text(
            'Challenge',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: dynamicColor.onPrimaryContainer),
          ),
        ),
      ),
      backgroundColor: dynamicColor.background,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: _width,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Available',
                style: TextStyle(
                    fontSize: 23,
                    color: dynamicColor.primary,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            //now listview
            width: _width * 0.9,
            height: _height * 0.6,
            child: ListView.builder(
                itemCount: nowTitle.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      width: _width * 0.9,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: dynamicColor.primaryContainer),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: _width * 0.7,
                                  child: Text(
                                    '${nowTitle[index]}',
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: dynamicColor.onPrimaryContainer,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                    width: _width * 0.7,
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 28,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: dynamicColor
                                                  .onPrimaryContainer),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  size: 16,
                                                  color:
                                                      dynamicColor.onTertiary,
                                                ),
                                                Text(
                                                  ' 379',
                                                  style: TextStyle(
                                                      color: dynamicColor
                                                          .onTertiary,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 28,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: dynamicColor
                                                  .onPrimaryContainer),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 10),
                                            child: Text('21days left',
                                                style: TextStyle(
                                                    color:
                                                        dynamicColor.onTertiary,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                            Container(
                              height: 100,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: dynamicColor.onPrimaryContainer,
                                  size: 25,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}

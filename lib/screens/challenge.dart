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
  ];
  List<String> exportTitle = [
    'Visiting recycling Club',
  ];
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFFEDEEFA),
        title: Container(
          width: _width,
          child: Text(
            'Challenge',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Palette.jetblack),
          ),
        ),
      ),
      backgroundColor: Color(0xFFFEFBFF),
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
                'NOW',
                style: TextStyle(
                    fontSize: 32,
                    color: Palette.babyblue,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Container(
            //now listview
            width: _width * 0.9,
            height: _height * 0.15,
            child: ListView.builder(
                itemCount: nowTitle.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      width: _width * 0.9,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 217, 226, 255)),
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
                                        color: Palette.jetblack,
                                        fontWeight: FontWeight.w700),
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
                                              color: Palette.sapphire),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  size: 16,
                                                  color: Palette.white,
                                                ),
                                                Text(
                                                  ' 379',
                                                  style: TextStyle(
                                                      color: Palette.white,
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
                                              color: Palette.sapphire),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 10),
                                            child: Text('21days left',
                                                style: TextStyle(
                                                    color: Palette.white,
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
                                  Icons.local_fire_department_rounded,
                                  color: Palette.grapefruit,
                                  size: 33,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                }),
          ),
          Container(
            width: _width,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Available',
                style: TextStyle(
                    fontSize: 32,
                    color: Palette.babyblue,
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
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(255, 217, 226, 255)),
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
                                  '${exportTitle[index]}',
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Palette.jetblack,
                                      fontWeight: FontWeight.w700),
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
                                            color: Palette.sapphire),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, right: 10),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person,
                                                size: 16,
                                                color: Palette.white,
                                              ),
                                              Text(
                                                ' 18',
                                                style: TextStyle(
                                                    color: Palette.white,
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
                                            color: Palette.sapphire),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, right: 10),
                                          child: Text('21days left',
                                              style: TextStyle(
                                                  color: Palette.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Palette.sapphire),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Palette.white,
                                size: 33,
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
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

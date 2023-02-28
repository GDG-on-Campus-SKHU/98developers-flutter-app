import 'package:flutter/material.dart';
import '../utilities/palette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            'Home',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Palette.jetblack),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(84, 85, 136, 238)),
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Palette.jetblack,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
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
                'Popular',
                style: TextStyle(
                    fontSize: 32,
                    color: Palette.babyblue,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Container(
            width: _width * 0.9,
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Palette.sapphire),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 38,
                ),
                Container(
                  width: _width * 0.9,
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    'Eating home-cooked food',
                    style: TextStyle(
                        fontSize: 22,
                        color: Palette.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Container(
                  width: _width * 0.9,
                  height: 110,
                  padding: EdgeInsets.only(left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Cooking with fresh ingredients',
                            style:
                                TextStyle(fontSize: 14, color: Palette.white),
                          ),
                          Container(
                              width: _width * 0.5,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Color(0xFFD9E2FF)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            size: 16,
                                            color: Palette.sapphire,
                                          ),
                                          Text(
                                            ' 379',
                                            style: TextStyle(
                                                color: Palette.sapphire,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
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
                                        borderRadius: BorderRadius.circular(25),
                                        color: Color(0xFFD9E2FF)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10),
                                      child: Text('21days left',
                                          style: TextStyle(
                                              color: Palette.sapphire,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Container(
                        height: 100,
                        child: Icon(
                          Icons.local_fire_department_rounded,
                          color: Palette.grapefruit,
                          size: 100,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: _width,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Status',
                style: TextStyle(
                    fontSize: 32,
                    color: Palette.babyblue,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import '../utilities/palette.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final dynamicColor = Theme.of(context).colorScheme;
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
                  color: dynamicColor.primaryContainer),
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: dynamicColor.onPrimaryContainer,
                  size: 25,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      backgroundColor: Color(0xFFFEFBFF),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: _height * 0.6,
            child: CarouselSlider(
              items: [
                Container(
                  width: _width,
                  height: _height,
                  color: Colors.amber,
                ),
                Container(
                  width: _width,
                  height: _height,
                  color: Colors.green,
                ),
                Container(
                  width: _width,
                  height: _height,
                  color: Colors.red,
                )
              ],
              options: CarouselOptions(
                height: _height,
                enlargeCenterPage: false,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 1500),
                viewportFraction: 1,
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.30,
            minChildSize: 0.25,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: bottomContent(_width, context),
              );
            },
          ),
        ],
      )),
    );
  }
}

Widget bottomContent(_width, context) {
  final dynamicColor = Theme.of(context).colorScheme;
  return Container(
    height: MediaQuery.of(context).size.height * 0.75,
    decoration: BoxDecoration(
      color: dynamicColor.background,
      // borderRadius: BorderRadius.only(
      //   topLeft: Radius.circular(25),
      //   topRight: Radius.circular(25),
      // )
    ),
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
              'Status',
              style: TextStyle(
                  fontSize: 32,
                  color: dynamicColor.primary,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: _width * 0.9,
          height: 100,
          decoration: BoxDecoration(
              color: dynamicColor.secondaryContainer,
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            'Oops! Your submission is empty',
            style: TextStyle(color: dynamicColor.onSecondaryContainer),
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
              'Popular',
              style: TextStyle(
                  fontSize: 32,
                  color: dynamicColor.primary,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        Container(
          height: 240,
          child: ListView(
            children: [
              CarouselSlider(
                items: [
                  sliderContainer(
                    _width,
                    'Eating home-cooked food',
                    'Cooking with fresh ingredients',
                    ' 379',
                    '21days left',
                    dynamicColor.onPrimaryContainer,
                    dynamicColor.secondaryContainer,
                    dynamicColor.onPrimaryContainer,
                    dynamicColor.onSecondary,
                  ),
                ],
                options: CarouselOptions(
                  height: 230,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.easeInOutSine,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 1500),
                  viewportFraction: 1,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}

Widget sliderContainer(_width, titleText, subtitleText, person, day,
    titleTextColor, containerColor, circleContainerColor, circleTextColor) {
  return Container(
    width: _width * 0.9,
    height: 220,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), color: containerColor),
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
            titleText,
            style: TextStyle(
                fontSize: 22,
                color: titleTextColor,
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
                    subtitleText,
                    style: TextStyle(fontSize: 14, color: titleTextColor),
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
                                color: circleContainerColor),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 16,
                                    color: circleTextColor,
                                  ),
                                  Text(
                                    person,
                                    style: TextStyle(
                                        color: circleTextColor,
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
                                color: circleContainerColor),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Text(day,
                                  style: TextStyle(
                                      color: circleTextColor,
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
                  color: Color(0xFFFD6D6D),
                  size: 100,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

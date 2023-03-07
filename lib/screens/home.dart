import 'package:flutter/material.dart';
import 'package:zikiza/screens/submission.dart';

import '../utilities/palette.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _imgUrl = [];
  List<String> _imgtitleText = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomePostData();
  }

  void getHomePostData() async {
    final response = await http
        .get(Uri.parse('https://www.greenpeace.org/korea/make-a-change/'));
    final document = parser.parse(response.body);

    if (response.statusCode == 200) {
      final textElement =
          document.querySelectorAll('div.box > div.content > p');
      _imgtitleText = textElement.map((element) => element.innerHtml).toList();
      document.getElementsByTagName('div').forEach((element) {
        final String? style = element.attributes['style'];

        if (style != null) {
          String imgSrc = element.attributes.toString();

          int srcStart = imgSrc.indexOf('(');
          int end = imgSrc.indexOf(')');

          if (srcStart == -1 || end == -1) {
            print('object');
          } else {
            setState(() {
              _imgUrl.add(imgSrc.substring(srcStart + 1, end));
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dynamicColor = Theme.of(context).colorScheme;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    List<Widget> getSlideList() {
      List<Widget> childs = [];
      for (var i = 0; i < 3; i++) {
        childs.add(imgSlider(_width, _height, _imgUrl[i],
            _imgtitleText[i].replaceAll('기간:', ''), context));
      }
      return childs;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: dynamicColor.surfaceVariant,
        title: Container(
          width: _width,
          child: Text(
            '',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: dynamicColor.onPrimaryContainer),
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
      backgroundColor: dynamicColor.background,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
              height: _height * 0.6,
              child: _imgUrl.isEmpty == false
                  ? CarouselSlider(
                      items: getSlideList(),
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
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      color: dynamicColor.primaryContainer,
                    ))),
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

Widget imgSlider(_width, _height, slideImg, imgTitle, context) {
  final dynamicColor = Theme.of(context).colorScheme;
  return Container(
    width: _width,
    height: _height * 0.9,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: NetworkImage(slideImg),
        fit: BoxFit.cover,
      ),
    ),
    child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: _width,
              height: _height * 0.6,
              color: dynamicColor.onSecondaryContainer.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: _width,
                      child: Text('$imgTitle',
                          style: TextStyle(color: dynamicColor.background))),
                  Container(
                      alignment: Alignment.center,
                      width: _width,
                      child: Text('신청하려면 이미지 클릭하셈',
                          style: TextStyle(color: dynamicColor.background))),
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget bottomContent(_width, context) {
  final dynamicColor = Theme.of(context).colorScheme;
  return Container(
    height: MediaQuery.of(context).size.height * 0.75,
    decoration: BoxDecoration(
      color: dynamicColor.background,
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
        GestureDetector(
          child: Container(
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
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => submissionScreen()));
          },
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zikiza/screens/submission.dart';
import 'package:zikiza/models/user_data_service.dart';
import 'package:zikiza/utilities/typografie.dart';
import 'package:zikiza/widgets/light_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../cubits/challenge_list_cubit.dart';
import 'enroll.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _imgUrl = [];
  List<String> _imgtitleText = [];
  List<String> _postUrl = [
    'https://cloud.greensk.greenpeace.org/api-abtest/?_ga=2.261739021.1211206065.1679550185-36497864.1677742303',
    'https://cloud.greensk.greenpeace.org/api-biodiversity-honeybee/?_ga=2.261739021.1211206065.1679550185-36497864.1677742303',
    'https://cloud.greensk.greenpeace.org/petitions-ocean-sanctuaries2?_ga=2.95099036.1211206065.1679550185-36497864.1677742303'
  ];

  @override
  void initState() {
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
      // document.getElementsByTagName('a').forEach(
      //   (element) {
      //     final String? href = element.attributes['href'];

      //     if (href != null) {
      //       String postUrl = element.attributes.toString();
      //       int endPoint = postUrl.indexOf(',');

      //       if (mounted) {
      //         setState(() {
      //           log(postUrl);
      //           _postUrl.add(postUrl);
      //         });
      //       }
      //     }
      //   },
      // );
      document.getElementsByTagName('div').forEach(
        (element) {
          final String? style = element.attributes['style'];

          if (style != null) {
            String imgSrc = element.attributes.toString();

            int srcStart = imgSrc.indexOf('(');
            int end = imgSrc.indexOf(')');

            if (srcStart == -1 || end == -1) {
            } else {
              if (mounted) {
                setState(() {
                  _imgUrl.add(imgSrc.substring(srcStart + 1, end));
                });
              }
            }
          }
        },
      );
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
            _imgtitleText[i].replaceAll('기간:', ''), context, _postUrl[i]));
      }
      return childs;
    }

    return Scaffold(
      appBar: LightAppBar(
        backgroundColor: dynamicColor.surface,
        title: Typografie()
            .HeadlineMedium("Home", dynamicColor.onPrimaryContainer),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Container(
              width: 35.0,
              height: 35.0,
              child: IconButton(
                icon: Icon(Icons.notifications_rounded, size: 20.0),
                onPressed: () {},
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: dynamicColor.primaryContainer),
            ),
          ),
        ],
      ),
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
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 1500),
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
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: bottomContent(_width, context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    getHomePostData();
    super.dispose();
  }
}

Widget imgSlider(_width, _height, slideImg, imgTitle, context, postUrl) {
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
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Typografie()
                        .LabelLarge("$imgTitle", dynamicColor.onPrimary),
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: _width * 0.3,
                      child: Typografie()
                          .BodyMedium("자세히 보기", dynamicColor.onPrimary),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0, color: dynamicColor.onPrimary)),
                    ),
                    onTap: () {
                      _launchUrl(Uri.parse(postUrl));
                    },
                  ),
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
              child: Typografie().DisplaySmall('Status', dynamicColor.primary)),
        ),
        GestureDetector(
          child: FutureBuilder(
            future: getUserData(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                var id = snapshot.data!.challenges![0].id;
                return GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: _width * 0.9,
                    height: 100,
                    decoration: BoxDecoration(
                        color: dynamicColor.secondaryContainer,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: _width * 0.6,
                              child: Typografie().BodyLarge(
                                  '${snapshot.data!.challenges![0].topic}',
                                  dynamicColor.onPrimaryContainer),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            submissionScreen(id: id)));
                              },
                              icon: Icon(Icons.camera),
                              color: dynamicColor.onPrimaryContainer,
                            )
                          ],
                        )),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => submissionScreen(id: id)));
                  },
                );
              } else {
                return Container(
                    alignment: Alignment.center,
                    width: _width * 0.9,
                    height: 100,
                    decoration: BoxDecoration(
                        color: dynamicColor.secondaryContainer,
                        borderRadius: BorderRadius.circular(25)),
                    child: Typografie().BodyLarge(
                        'Oops! Your submission is empty',
                        dynamicColor.onPrimaryContainer));
              }
            },
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
              child:
                  Typografie().DisplaySmall('Popular', dynamicColor.primary)),
        ),
        Container(
            height: 240,
            child: BlocBuilder<ChallengeListCubit, ChallengeListState>(
              builder: (_, state) {
                return FutureBuilder(
                  future: _.read<ChallengeListCubit>().getChalllengeList(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (snapshot.hasData) {
                          var challengeId = snapshot.data!.listData[index].id;
                          var title = snapshot.data!.listData[index].topic;
                          var headCount =
                              snapshot.data!.listData[index].headCount;
                          var startDate = snapshot
                              .data!.listData[index].periodStartDate!
                              .substring(5, 10);
                          var endDate = snapshot
                              .data!.listData[index].periodEndDate!
                              .substring(5, 10);
                          return CarouselSlider(
                            items: [
                              sliderContainer(
                                  _width,
                                  '$title',
                                  'Cooking with fresh ingredients',
                                  '$headCount',
                                  '$startDate ~ $endDate',
                                  context,
                                  challengeId),
                            ],
                            options: CarouselOptions(
                              height: 220,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 10,
                              autoPlayCurve: Curves.easeInOutSine,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 1500),
                              viewportFraction: 1,
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    );
                  },
                );
              },
            )),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}

Widget sliderContainer(
    _width, titleText, subtitleText, person, day, context, id) {
  final dynamicColor = Theme.of(context).colorScheme;
  return GestureDetector(
    child: Container(
      width: _width * 0.9,
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: dynamicColor.secondaryContainer),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: _width * 0.9,
              padding: EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Typografie()
                  .LabelLarge('$titleText', dynamicColor.onPrimaryContainer)),
          Container(
            width: _width * 0.9,
            height: 110,
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Typografie().BodyMedium(
                        '$subtitleText', dynamicColor.onPrimaryContainer),
                    Container(
                        width: _width * 0.45,
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 28,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: dynamicColor.onPrimaryContainer),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 11,
                                      color: dynamicColor.onSecondary,
                                    ),
                                    Typografie().BodySmall(
                                        '$person', dynamicColor.onSecondary)
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
                                  color: dynamicColor.onPrimaryContainer),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: Typografie().BodySmall(
                                      '$day', dynamicColor.onSecondary)),
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
    ),
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EnrollScreen(
              id: id,
            ),
          ));
    },
  );
}

Future<void> _launchUrl(imgHttpUrl) async {
  if (!await launchUrl(imgHttpUrl)) {
    throw Exception('Could not launch $imgHttpUrl');
  }
}

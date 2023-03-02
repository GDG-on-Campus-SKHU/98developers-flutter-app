import 'package:zikiza/utilities/palette.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> challengeLog = [];
  @override
  Widget build(BuildContext context) {
    final dynamicColor = Theme.of(context).colorScheme;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: dynamicColor.surfaceVariant,
        title: Container(
            width: _width,
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Profile',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            )),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: dynamicColor.primaryContainer),
                  child: IconButton(
                    icon: Icon(Icons.settings, size: 30),
                    onPressed: () {},
                  )))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: _width,
            height: _height * 0.15,
            alignment: Alignment.center,
            child: Container(
              width: _width * 0.9,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Container(
                      height: _height * 0.1,
                      alignment: Alignment.center,
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Palette.babyblue),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: _width * 0.5,
                          child: Text(
                            'Hyeonbok Lee',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: dynamicColor.onPrimaryContainer),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: _width * 0.5,
                          child: Text(
                            'test@gmail.com',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: dynamicColor.onPrimaryContainer),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: _width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'My history',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: dynamicColor.onPrimaryContainer),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              width: _width * 0.9,
              child: Divider(
                  color: dynamicColor.onPrimaryContainer, thickness: 2.0)),
          Container(
              width: _width,
              height: _height * 0.45,
              child: challengLogList(challengeLog.length, _width, challengeLog,
                  dynamicColor.secondary))
        ],
      )),
    );
  }
}

Widget challengLogList(cnt, mainWidth, list, textColor) {
  if (cnt == 0 || cnt == null) {
    return Center(
      child: Text(
        'The challenge history is displayed here',
        style: TextStyle(fontSize: 17, color: textColor),
      ),
    );
  } else {
    return ListView.builder(
      itemCount: cnt,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: mainWidth * 0.9,
          alignment: Alignment.center,
          child: Text('${list[index]}'),
        );
      },
    );
  }
}

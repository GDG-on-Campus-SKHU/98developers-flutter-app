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
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFFEDEEFA),
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
                      color: Color.fromARGB(84, 85, 136, 238)),
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
              decoration: BoxDecoration(
                  color: Palette.darkgrey,
                  borderRadius: BorderRadius.circular(25)),
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
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: _width * 0.5,
                          child: Text(
                            'Hyeonbok Lee',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Palette.white),
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
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Palette.grey),
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
                'History',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              width: _width * 0.9,
              child: Divider(color: Palette.jetblack, thickness: 2.0)),
          Container(
              width: _width,
              height: _height * 0.45,
              child: challengLogList(challengeLog.length, _width, challengeLog))
        ],
      )),
    );
  }
}

Widget challengLogList(cnt, mainWidth, list) {
  if (cnt == 0 || cnt == null) {
    return Center(
      child: Text(
        'The challenge history is displayed here',
        style: TextStyle(fontSize: 17),
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

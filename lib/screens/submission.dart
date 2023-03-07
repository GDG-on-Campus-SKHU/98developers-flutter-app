import 'package:flutter/material.dart';
import 'package:zikiza/screens/takepicture.dart';

class submissionScreen extends StatefulWidget {
  const submissionScreen({super.key});

  @override
  State<submissionScreen> createState() => _submissionScreenState();
}

class _submissionScreenState extends State<submissionScreen> {
  @override
  Widget build(BuildContext context) {
    final dynamicColor = Theme.of(context).colorScheme;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: dynamicColor.background,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: dynamicColor.surfaceVariant,
      ),
      body: SafeArea(
          child: Container(
        height: _height * 0.7,
        color: dynamicColor.background,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: _width,
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  '제목',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: dynamicColor.onBackground),
                ),
              ),
              Container(
                width: _width,
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  '목표',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: dynamicColor.onBackground),
                ),
              ),
              Container(
                width: _width,
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  '기한',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: dynamicColor.onBackground),
                ),
              )
            ],
          ),
        ),
      )),
      bottomSheet: Container(
        height: 120,
        alignment: Alignment.center,
        child: GestureDetector(
          child: Container(
            width: _width * 0.5,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: dynamicColor.secondaryContainer),
            child: Icon(
              Icons.camera_alt,
              color: dynamicColor.onSecondaryContainer,
              size: 40,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => TakePictureScreen()));
          },
        ),
      ),
    );
  }
}

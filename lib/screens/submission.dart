import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zikiza/models/post_submission.dart';
import 'package:zikiza/models/challenge_service.dart';

class submissionScreen extends StatefulWidget {
  const submissionScreen({super.key, required this.id});
  final id;

  @override
  State<submissionScreen> createState() => _submissionScreenState();
}

class _submissionScreenState extends State<submissionScreen> {
  XFile? _pickedFile;
  _showBottomSheet(bgColor, buttonColor, textColor) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                child: GestureDetector(
              onTap: () => _getCameraImage(),
              child: Text(
                '사진찍기',
                style: TextStyle(color: textColor),
              ),
            )),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }

  _getCameraImage() async {
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 100,
        maxHeight: 100,
        imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }

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
          child: FutureBuilder(
            future: getChallenges(widget.id),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                var topic = snapshot.data!.topic;
                var exResult = snapshot.data!.expectedResults;

                return Column(
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
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        '$topic',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
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
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        '$exResult',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: dynamicColor.onBackground),
                      ),
                    ),
                    Container(
                      width: _width,
                      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Text(
                        '기한',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: dynamicColor.onBackground),
                      ),
                    ),
                    Container(
                      width: _width * 0.9,
                      height: 300,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: dynamicColor.secondaryContainer)),
                      child: _pickedFile == null
                          ? Container(
                              child: GestureDetector(
                                onTap: () {
                                  _showBottomSheet(
                                      dynamicColor.background,
                                      dynamicColor.secondaryContainer,
                                      dynamicColor.onSecondaryContainer);
                                },
                                child: Center(child: Text('이미지 제출 하셈')),
                              ),
                            )
                          : Center(
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(File(_pickedFile!.path)),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _pickedFile == null
                        ? Container(
                            width: _width * 0.5,
                            height: 100,
                            child: Text('아직 제출 못함 ㅅㄱ'),
                          )
                        : GestureDetector(
                            child: Container(
                              width: _width * 0.5,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: dynamicColor.secondaryContainer),
                              child: Text(
                                '제출하기',
                                style: TextStyle(
                                    color: dynamicColor.onSecondaryContainer),
                              ),
                            ),
                            onTap: () {
                              postSubmission(widget.id, _pickedFile!.path);
                            },
                          )
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      )),
    );
  }
}

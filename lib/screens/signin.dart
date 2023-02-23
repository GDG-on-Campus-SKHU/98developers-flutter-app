import 'package:flutter/material.dart';
import '../utilities/palette.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    TextEditingController idTextController = TextEditingController();
    TextEditingController pwTextController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            alignment: Alignment.center,
            width: _width,
            child: Text(
              'MIRI',
              style: TextStyle(
                  color: Palette.sapphire,
                  fontSize: 39,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: _width,
            child: Text(
              'join us for the Earth',
              style: TextStyle(
                color: Palette.grey,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: 160,
          ),
          Container(
              width: _width * 0.8,
              child: Column(
                children: [
                  LogininputBox(idTextController, 'ID', context),
                  SizedBox(
                    height: 40,
                  ),
                  LogininputBox(pwTextController, 'Password', context),
                ],
              )),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            //signup button
            child: Container(
              alignment: Alignment.center,
              width: _width * 0.8,
              height: 100,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 51, 102, 204)),
              child: Text(
                'Sing In',
                style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            onTap: () {
              if (idTextController.text == '' || pwTextController.text == '') {
                print('로그인 똑바로하셈');
              } else {
                print('로그인 성공');
              }
            },
          )
        ],
      )),
    );
  }
}

Widget LogininputBox(controller, hintText, cnt) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 2, color: Palette.babyblue)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Palette.white)),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 17)),
  );
}

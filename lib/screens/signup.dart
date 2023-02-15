import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    // FocusNode _focusNode = new FocusNode();
    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController repasswordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: _width,
              height: _height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 51, 102, 204),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Enter below to create an account.',
                    style: TextStyle(fontSize: 19),
                  ),
                ],
              ),
            ),
            Container(
                width: _width * 0.8,
                height: _height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    inputBox(emailController, 'Email', context),
                    SizedBox(
                      height: 40,
                    ),
                    inputBox(usernameController, 'UserName', context),
                    SizedBox(
                      height: 40,
                    ),
                    inputBox(passwordController, 'Password', context),
                    SizedBox(
                      height: 40,
                    ),
                    inputBox(repasswordController, 'Password', context),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: _width * 0.8,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 51, 102, 204)),
                        child: Text(
                          'Sing Up',
                          style: TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        if (repasswordController.text == '' ||
                            passwordController.text == '' ||
                            usernameController == '' ||
                            emailController == '') {
                          print('회원가입 똑바로하셈');
                        } else {
                          print('회원가입 성공');
                        }
                      },
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

Widget inputBox(controller, hintText, cnt) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color.fromARGB(255, 51, 102, 204))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white)),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 17)),
  );
}

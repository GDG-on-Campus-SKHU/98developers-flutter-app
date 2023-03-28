import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikiza/cubits/google_auth_cubit.dart';
import 'package:zikiza/utilities/typografie.dart';
import 'package:zikiza/widgets/light_appbar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> challengeLog = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext _) {
    final dynamicColor = Theme.of(_).colorScheme;
    final _width = MediaQuery.of(_).size.width;
    final _height = MediaQuery.of(_).size.height;

    return Scaffold(
      body: BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
        builder: (_, state) {
          if (state is GoogleAuthSuccess)
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 10.0),
                  Container(
                    width: _width,
                    height: _height * 0.15,
                    alignment: Alignment.center,
                    child: Container(
                      width: _width * 0.9,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Container(
                              height: _height * 0.1,
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage("${state.user.photoURL}"),
                                radius: 40.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: _width * 0.5,
                                  child: Typografie().LabelLarge(
                                    "${state.user.displayName}",
                                    dynamicColor.onPrimaryContainer,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  width: _width * 0.5,
                                  child: Typografie().BodyMedium(
                                    "${state.user.email}",
                                    dynamicColor.secondary,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    width: _width,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Typografie().LabelLarge(
                            'My History', dynamicColor.onPrimaryContainer)),
                  ),
                  Container(
                    width: _width * 0.9,
                    child: Divider(
                        color: dynamicColor.onPrimaryContainer, thickness: 2.0),
                  ),
                  Container(
                    width: _width,
                    height: _height * 0.45,
                    child: historyList(challengeLog.length, _width,
                        challengeLog, dynamicColor.onPrimaryContainer),
                  ),
                ],
              ),
            );
          else {
            return Container();
          }
        },
      ),
      appBar: LightAppBar(
        backgroundColor: dynamicColor.surface,
        title: Typografie()
            .HeadlineMedium("Profile", dynamicColor.onPrimaryContainer),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Container(
              width: 35.0,
              height: 35.0,
              child: IconButton(
                icon: Icon(Icons.settings, size: 20.0),
                onPressed: () {
                  showMenu(
                    context: _,
                    position: RelativeRect.fill,
                    items: [
                      PopupMenuItem<int>(
                        value: 0,
                        child: const Text("View Licenses"),
                        onTap: () => LicensePage(
                          applicationName: "ZIKIZA",
                          applicationVersion: "1.0",
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Text('Sign out'),
                        onTap: () {
                          _.read<GoogleAuthCubit>().signOutWithGoogle();
                        },
                      ),
                    ],
                  );
                },
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: dynamicColor.primaryContainer),
            ),
          ),
        ],
      ),
    );
  }
}

Widget historyList(count, width, list, textColor) {
  if (count == 0 || count == null) {
    return Center(
        child: Typografie()
            .BodyMedium('The challenge history is displayed here', textColor));
  } else {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: width * 0.9,
          alignment: Alignment.center,
          child: Text('${list[index]}'),
        );
      },
    );
  }
}

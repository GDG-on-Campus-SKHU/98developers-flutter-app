import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikiza/cubits/google_auth_cubit.dart';
import 'package:zikiza/main.dart';
import 'package:zikiza/utilities/typografie.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext _) {
    final _width = MediaQuery.of(_).size.width;
    final _height = MediaQuery.of(_).size.height;
    return Scaffold(
      body: BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
        builder: (_, state) {
          if (state is GoogleAuthInitial) {
            return Stack(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 45.0),
                    width: _width * 0.9,
                    height: double.infinity,
                    color: Theme.of(_).colorScheme.background,
                    child: Column(
                      children: [
                        Typografie().DisplayMedium(
                          "ZIKIZA",
                          Theme.of(_).colorScheme.primary,
                        ),
                        SizedBox(height: 10.0),
                        Typografie().TitleLarge(
                          "Join us for the Earth.",
                          Theme.of(_).colorScheme.secondary,
                        ),
                        SizedBox(height: _height * 0.1),
                        Image.asset(
                          "assets/images/app_zikiza.png",
                          width: 175.0,
                          height: 175.0,
                        ),
                        SizedBox(height: _height * 0.1),
                        GoogleSignInButton(
                          onTap: () {
                            _.read<GoogleAuthCubit>().signInWithGoogle();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/images/google_light.png",
                                alignment: Alignment.center,
                                width: 24.0,
                                height: 24.0,
                              ),
                              Typografie().LabelLarge(
                                "Sign in with Google",
                                Theme.of(_).colorScheme.secondary,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(_).colorScheme.background,
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                                color: Theme.of(_).colorScheme.secondary),
                          ),
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          width: _width * 0.8,
                          height: 50.0,
                        ),
                        SizedBox(height: 25.0),
                        CreateAccountButton(
                          onTap: () => showDialog(
                            context: _,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text("Caution"),
                                content: const Text(
                                    "Local Account service is not currently available."),
                              );
                            },
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Typografie().LabelLarge(
                                "Create a ZIKIZA account",
                                Theme.of(_).colorScheme.secondary,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(_).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          width: _width * 0.8,
                          height: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is GoogleAuthSuccess) {
            return NavigationBarWidget();
          } else if (state is GoogleAuthLoading) {
            if (Platform.isIOS)
              return Center(child: CupertinoActivityIndicator());
            else
              return Center(child: CircularProgressIndicator());
          } else if (state is GoogleAuthFailed) {
            return InitialScreen();
          } else {
            return Container();
          }
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(_).colorScheme.background,
        toolbarHeight: 0.0,
      ),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  CreateAccountButton({
    Key? key,
    required this.onTap,
    required this.padding,
    required this.child,
    required this.height,
    required this.width,
    required this.decoration,
  });

  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final double height;
  final double width;
  final Decoration? decoration;

  Widget build(BuildContext _) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        child: child,
        width: width,
        height: height,
        decoration: decoration,
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({
    Key? key,
    required this.onTap,
    required this.padding,
    required this.child,
    required this.height,
    required this.width,
    required this.decoration,
  });

  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final double height;
  final double width;
  final Decoration? decoration;

  Widget build(BuildContext _) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        child: child,
        width: width,
        height: height,
        decoration: decoration,
      ),
    );
  }
}

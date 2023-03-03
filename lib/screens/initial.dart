import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikiza/cubits/google_auth_cubit.dart';
import 'package:zikiza/utilities/typografie.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext _) {
    final _width = MediaQuery.of(_).size.width;
    final _height = MediaQuery.of(_).size.height;
    return BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
      builder: (_, state) {
        return Scaffold(
          backgroundColor: Theme.of(_).colorScheme.primary,
          body: Stack(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 95.0),
                  width: _width * 0.9,
                  height: double.infinity,
                  color: Theme.of(_).colorScheme.primary,
                  child: Column(
                    children: [
                      Typografie().DisplayMedium(
                        "ZIKIZA",
                        Theme.of(_).colorScheme.onPrimary,
                      ),
                      SizedBox(height: 10.0),
                      Typografie().TitleLarge(
                        "Join us for the Earth.",
                        Theme.of(_).colorScheme.onPrimary,
                      ),
                      SizedBox(height: _height * 0.4),
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
                              Theme.of(_).colorScheme.primary,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(_).colorScheme.background,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        width: _width * 0.8,
                        height: 55.0,
                      ),
                      SizedBox(height: 10.0),
                      CreateAccountButton(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Typografie().LabelLarge(
                              "Create an account",
                              Theme.of(_).colorScheme.onPrimary,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(_).colorScheme.onPrimary),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        width: _width * 0.8,
                        height: 55,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
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

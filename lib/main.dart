
import 'package:zikiza/screens/home.dart';
import 'package:zikiza/utilities/palette.dart';
import './screens/challenge.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: 'NotoSans',
      ),

      home: BottonNavigation(),
    );
  }
}

class BottonNavigation extends StatefulWidget {
  const BottonNavigation({super.key});

  @override
  State<BottonNavigation> createState() => _BottonNavigationState();
}

class _BottonNavigationState extends State<BottonNavigation> {
  int _selectedIndex = 0;

  @override
  void initState() {
    //해당 클래스가 호출되었을떄
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [
        HomeScreen(),
        ChallengeScreen(),
        HomeScreen(),
        HomeScreen()
      ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Palette.white,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              size: 35,
              color: Palette.babyblue,
            ),
            icon: Icon(
              Icons.home,
              size: 35,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.local_fire_department_rounded,
              size: 35,
              color: Palette.babyblue,
            ),
            icon: Icon(
              Icons.local_fire_department_rounded,
              size: 35,
            ),
            label: 'Challenges',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.near_me_rounded,
              size: 35,
              color: Palette.babyblue,
            ),
            icon: Icon(
              Icons.near_me_rounded,
              size: 35,
            ),
            label: 'Explore',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              size: 35,
              color: Palette.babyblue,
            ),
            icon: Icon(
              Icons.person,
              size: 35,
            ),
            label: 'Profile',
          ),
        ],
      ),

    );
  }
}

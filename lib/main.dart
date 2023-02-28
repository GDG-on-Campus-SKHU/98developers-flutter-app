import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:zikiza/screens/home.dart';
import 'package:zikiza/screens/challenge.dart';
//import 'package:zikiza/screens/explore.dart';
import 'package:zikiza/screens/profile.dart';
import 'package:zikiza/utilities/dynamic_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
      return MaterialApp(
        theme: DynamicTheme.lightTheme(lightColorScheme),
        darkTheme: DynamicTheme.darkTheme(darkColorScheme),
        //Default theme mode setting
        themeMode: ThemeMode.system,
        home: BottomNavigationBar(),
      );
    });
  }
}

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key});

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      body: const [
        HomeScreen(),
        ChallengeScreen(),
        HomeScreen(),
        ProfileScreen(),
      ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              size: 25,
              color: Theme.of(_).colorScheme.primary,
            ),
            icon: Icon(
              Icons.home,
              size: 25,
              color: Theme.of(_).colorScheme.secondary,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.local_fire_department_rounded,
              size: 25,
              color: Theme.of(_).colorScheme.primary,
            ),
            icon: Icon(
              Icons.local_fire_department_rounded,
              size: 25,
              color: Theme.of(_).colorScheme.secondary,
            ),
            label: 'Challenges',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.explore_rounded,
              size: 25,
              color: Theme.of(_).colorScheme.primary,
            ),
            icon: Icon(
              Icons.explore_rounded,
              size: 25,
              color: Theme.of(_).colorScheme.secondary,
            ),
            label: 'Explore',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              size: 25,
              color: Theme.of(_).colorScheme.primary,
            ),
            icon: Icon(
              Icons.person,
              size: 25,
              color: Theme.of(_).colorScheme.secondary,
            ),
            label: 'Profile',
          ),
        ],
        elevation: 2.0,
        backgroundColor: Theme.of(_).colorScheme.background,
        shadowColor: Theme.of(_).colorScheme.shadow,
        surfaceTintColor: Theme.of(_).colorScheme.surfaceTint,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

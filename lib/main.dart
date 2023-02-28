import 'package:zikiza/screens/home.dart';
import 'package:zikiza/utilities/palette.dart';
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
      // home: Scaffold(
      //   body: Center(
      //     child: Text('Hello World!'),
      //   ),
      // ),
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

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Palette.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.fireplace_sharp,
                size: 35,
              ),
              label: 'fire',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.navigation_outlined,
                size: 35,
              ),
              label: 'exp',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: 'exp',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Palette.sapphire,
          unselectedItemColor: Palette.grey,
          onTap: _onItemTapped),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikiza/screens/home.dart';
import 'package:zikiza/screens/challenge.dart';
import 'package:zikiza/screens/explore.dart';
import 'package:zikiza/screens/profile.dart';
import 'package:zikiza/utilities/dynamic_theme.dart';
import 'package:zikiza/cubits/navigation_bar_cubit.dart';

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
        //디바이스 시스템 설정에 따라 theme 모드 전환
        themeMode: ThemeMode.system,
        home: BlocProvider(
          create: (_) => NavigationBarCubit(),
          child: NavigationBarWidget(),
        ),
      );
    });
  }
}

class NavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext _) {
    return BlocBuilder<NavigationBarCubit, int>(
      builder: (_, state) {
        return Scaffold(
          body: [
            HomeScreen(),
            ChallengeScreen(),
            ExploreScreen(),
            ProfileScreen(),
          ][state],
          bottomNavigationBar: BlocBuilder<NavigationBarCubit, int>(
            builder: (_, state) {
              return NavigationBar(
                selectedIndex: state,
                onDestinationSelected: (index) => _
                    .read<NavigationBarCubit>()
                    .updateDestinationSelectedIndex(index),
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
                      Icons.workspace_premium_rounded,
                      size: 25,
                      color: Theme.of(_).colorScheme.primary,
                    ),
                    icon: Icon(
                      Icons.workspace_premium_rounded,
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
                height: 60.0,
              );
            },
          ),
        );
      },
    );
  }
}

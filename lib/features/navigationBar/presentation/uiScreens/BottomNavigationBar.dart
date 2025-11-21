import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/appColors.dart';
import 'package:movie_app/features/Home/presentation/uiScreens/HomeScreen.dart';
import 'package:movie_app/features/search/presentation/controllers/cubit/genres_cubit.dart';
import 'package:movie_app/features/search/presentation/controllers/cubit/search_cubit.dart';
import 'package:movie_app/features/search/presentation/ui_screens/search_screen.dart';
import 'package:movie_app/features/watchList/presentation/controller/ui_screen/watch_list.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  int index = 0;

  final List<Widget> screens = [
    const Homescreen(),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => GenresCubit()),
      ],
      child: SearchScreen(data: ''),
    ),
    WatchList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.ScaffoldCaller,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: screens[index],
      ),
      extendBody: true, // 🔥 allows nav bar to float transparently
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05), // 💎 almost transparent
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: BottomNavigationBar(
                backgroundColor:
                    Colors.transparent, // 👈 transparent background
                elevation: 0,
                currentIndex: index,
                selectedItemColor: Appcolors.blue,
                unselectedItemColor: Colors.white70,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                onTap: (value) => setState(() => index = value),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined, size: 26),
                    activeIcon: Icon(Icons.home, size: 30),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined, size: 26),
                    activeIcon: Icon(Icons.search_rounded, size: 30),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_outline, size: 26),
                    activeIcon: Icon(Icons.bookmark, size: 30),
                    label: 'Watch List',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

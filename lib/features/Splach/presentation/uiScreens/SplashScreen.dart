import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/appColors.dart';
import 'package:movie_app/features/navigationBar/presentation/uiScreens/BottomNavigationBar.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarCustom()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.ScaffoldCaller,
      body: Center(child: Image.asset("assets/images/popcorn 1.png")),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/appColors.dart';

class customtab extends StatelessWidget {
  const customtab({super.key, required this.screenWidth, required this.text});

  final double screenWidth;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        text,
        style: TextStyle(color: Appcolors.white, fontSize: screenWidth * 0.04),
      ),
    );
  }
}

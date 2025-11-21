import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/appColors.dart';
import 'package:movie_app/features/MovieDetailes/presentation/components/customtab.dart';

class Movie_Detaile_TabBar extends StatelessWidget {
  const Movie_Detaile_TabBar({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        customtab(screenWidth: screenWidth, text: 'Overview'),
        customtab(screenWidth: screenWidth, text: 'Reviews'),
        customtab(screenWidth: screenWidth, text: 'cast'),
      ],
      indicatorColor: Appcolors.white,

      indicatorWeight: 2,
      dividerHeight: 0,
    );
  }
}

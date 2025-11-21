import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/appColors.dart';

class customicon extends StatelessWidget {
  const customicon({super.key, required this.screenWidth, required this.icon});

  final double screenWidth;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: Appcolors.grey, size: screenWidth * 0.07);
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/appColors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.fontWeight,
    this.fontsize,
    required this.title,
  });
  final String title;
  final FontWeight? fontWeight;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Appcolors.white,
        fontSize: fontsize ?? 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

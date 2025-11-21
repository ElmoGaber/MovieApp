import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/appColors.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/cubit/MovieDetailes_model.dart';

class video_title extends StatelessWidget {
  const video_title({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.data,
  });

  final double screenHeight;
  final double screenWidth;
  final MovieDetailsModel data;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -screenHeight * 0.08,
      left: screenWidth * 0.42,
      right: screenWidth * 0.05,
      child: SizedBox(
        height: screenHeight * 0.07,
        child: Text(
          data.title ?? 'No Title',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Appcolors.white,
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.w600,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(1, 1),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

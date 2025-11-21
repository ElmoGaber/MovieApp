import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/appColors.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/cubit/MovieDetailes_model.dart';

class vote_Avarage extends StatelessWidget {
  const vote_Avarage({
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
      bottom: screenHeight * 0.02,
      right: screenWidth * 0.04,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenHeight * 0.005,
        ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.50),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(Icons.star, color: Appcolors.yellow, size: screenWidth * 0.06),
            SizedBox(width: screenWidth * 0.01),
            Text(
              data.voteAverage != null
                  ? data.voteAverage!.toStringAsFixed(1)
                  : 'N/A',
              style: TextStyle(
                color: Appcolors.white,
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

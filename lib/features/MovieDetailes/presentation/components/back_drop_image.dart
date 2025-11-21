import 'package:flutter/material.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/cubit/MovieDetailes_model.dart';

class backDropImage extends StatelessWidget {
  const backDropImage({
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
      bottom: -screenHeight * 0.07,
      left: screenWidth * 0.08,
      child: Container(
        width: screenWidth * 0.30,
        height: screenHeight * 0.20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500/${data.backdropPath}",
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, color: Colors.grey, size: 40),
          ),
        ),
      ),
    );
  }
}

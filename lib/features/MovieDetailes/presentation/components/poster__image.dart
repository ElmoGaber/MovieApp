import 'package:flutter/material.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/cubit/MovieDetailes_model.dart';

class Poster_Image extends StatelessWidget {
  const Poster_Image({
    super.key,
    required this.data,
    required this.screenHeight,
  });

  final MovieDetailsModel data;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: Image.network(
        "https://image.tmdb.org/t/p/w500/${data.posterPath}",
        fit: BoxFit.cover,
        width: double.infinity,
        height: screenHeight * 0.35,
      ),
    );
  }
}

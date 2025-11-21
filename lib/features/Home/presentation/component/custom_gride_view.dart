import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/model/moviemodel.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/cubit/movie_detailes_cubit.dart';
import 'package:movie_app/features/MovieDetailes/presentation/uiScreens/MovieDetailes.dart';

class CustomGrideView extends StatelessWidget {
  const CustomGrideView({super.key, required this.data});

  final List<MovieModel> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => MovieDetailesCubit(),
                  child: Moviedetailes(move: data[index]),
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500/${data[index].posterPath}",
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

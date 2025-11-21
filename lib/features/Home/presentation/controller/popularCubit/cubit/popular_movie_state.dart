part of 'popular_movie_cubit.dart';

@immutable
sealed class PopularMovieState {}

final class PopularMovieInitial extends PopularMovieState {}

final class PopularMovieLoading extends PopularMovieState {}

final class PopularMovieSuccess extends PopularMovieState {
  final MovieResponse data;

  PopularMovieSuccess({required this.data});
}

final class PopularMoviefailure extends PopularMovieState {}

part of 'movie_detailes_cubit.dart';

@immutable
sealed class MovieDetailesState {}

final class MovieDetailesInitial extends MovieDetailesState {}

final class MovieDetailesLoading extends MovieDetailesState {}

final class MovieDetailesSuccess extends MovieDetailesState {
  final MovieDetailsModel data;

  MovieDetailesSuccess({required this.data});
}

final class MovieDetailesFailure extends MovieDetailesState {
  final String message;

  MovieDetailesFailure({required this.message});
}

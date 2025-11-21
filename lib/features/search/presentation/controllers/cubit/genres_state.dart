// GenresState for managing genres data state
part of 'genres_cubit.dart';

abstract class GenresState {}

class GenresInitial extends GenresState {}

class GenresLoading extends GenresState {}

class GenresSuccess extends GenresState {
  final Map<int, String> genres;

  GenresSuccess({required this.genres});
}

class GenresFailure extends GenresState {
  final String errorMessage;

  GenresFailure({required this.errorMessage});
}

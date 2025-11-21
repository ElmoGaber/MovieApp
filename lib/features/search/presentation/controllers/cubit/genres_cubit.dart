import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  GenresCubit() : super(GenresInitial());

  // Fetch genres from TMDB API and store as Map<int, String>
  Future<void> fetchGenres() async {
    emit(GenresLoading());
    try {
      var dio = Dio();
      var res = await dio.get(
        "https://api.themoviedb.org/3/genre/movie/list?language=en",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2JiMGFkNmVhZjkxNzQ0NThmNjM3YzAyMTdhZDNiZiIsIm5iZiI6MTc2MTM5NzQwNS43NjEsInN1YiI6IjY4ZmNjYTlkM2I4MTI2ZTYyMjI3NTk1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0Q8LMMsmjZZXqYz8Bta6IQNgM9pYXasxrDtkOeEW060",
            "accept": "application/json",
          },
        ),
      );

      // Parse genres into Map<int, String>
      Map<int, String> genresMap = {};
      for (var genre in res.data['genres']) {
        genresMap[genre['id']] = genre['name'];
      }

      emit(GenresSuccess(genres: genresMap));
    } catch (e) {
      emit(GenresFailure(errorMessage: e.toString()));
    }
  }
}

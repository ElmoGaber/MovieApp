import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/model/moviemodel.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> search(String Query) async {
    var dio = Dio();
    emit(SearchLoading());
    try {
      var res = await dio.get(
        "https://api.themoviedb.org/3/search/movie?include_adult=false&language=en-US&page=1&query=$Query",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2JiMGFkNmVhZjkxNzQ0NThmNjM3YzAyMTdhZDNiZiIsIm5iZiI6MTc2MTM5NzQwNS43NjEsInN1YiI6IjY4ZmNjYTlkM2I4MTI2ZTYyMjI3NTk1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0Q8LMMsmjZZXqYz8Bta6IQNgM9pYXasxrDtkOeEW060",
            "accept": "application/json",
          },
        ),
      );
      var data = (res.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
      emit(SearchSuccess(data: data));
    } catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }
}

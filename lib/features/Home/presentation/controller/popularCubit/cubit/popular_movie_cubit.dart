import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Home/presentation/controller/popularCubit/cubit/popular_model.dart';

part 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit() : super(PopularMovieInitial());

  Future<void> get_popularMovie() async {
    Dio dio = Dio();
    emit(PopularMovieLoading());
    try {
      var res = await dio.get(
        "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2JiMGFkNmVhZjkxNzQ0NThmNjM3YzAyMTdhZDNiZiIsIm5iZiI6MTc2MTM5NzQwNS43NjEsInN1YiI6IjY4ZmNjYTlkM2I4MTI2ZTYyMjI3NTk1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0Q8LMMsmjZZXqYz8Bta6IQNgM9pYXasxrDtkOeEW060",
            "accept": "application/json",
          },
        ),
      );

      var data = MovieResponse.fromJson(res.data);
      print(res.data);
      emit(PopularMovieSuccess(data: data));
    } catch (e) {
      emit(PopularMoviefailure());
      rethrow;
    }
  }
}

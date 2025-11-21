import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/cubit/MovieDetailes_model.dart';

part 'movie_detailes_state.dart';

class MovieDetailesCubit extends Cubit<MovieDetailesState> {
  MovieDetailesCubit() : super(MovieDetailesInitial());
  void refresh() {
    emit(MovieDetailesInitial());
  }

  Future<void> Get_movie_Detailes(String id) async {
    Dio dio = Dio();

    if (isClosed) return; // ✅ تأكد إن Cubit مفتوح قبل emit
    emit(MovieDetailesLoading());

    try {
      var res = await dio.get(
        "https://api.themoviedb.org/3/movie/$id?language=en-US",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2JiMGFkNmVhZjkxNzQ0NThmNjM3YzAyMTdhZDNiZiIsIm5iZiI6MTc2MTM5NzQwNS43NjEsInN1YiI6IjY4ZmNjYTlkM2I4MTI2ZTYyMjI3NTk1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0Q8LMMsmjZZXqYz8Bta6IQNgM9pYXasxrDtkOeEW060",
            "accept": "application/json",
          },
        ),
      );

      var data = MovieDetailsModel.fromJson(res.data);

      if (!isClosed) {
        emit(MovieDetailesSuccess(data: data)); // ✅ emit فقط لو لسه مفتوح
      }
    } catch (e) {
      if (!isClosed) {
        emit(MovieDetailesFailure(message: e.toString())); // ✅ نفس الفكرة هنا
      }
    }
  }
}

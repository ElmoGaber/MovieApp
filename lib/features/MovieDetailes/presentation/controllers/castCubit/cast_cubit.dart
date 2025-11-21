import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/castCubit/cast_model.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit() : super(CastInitial());

  Future<void> Get_cast(String id) async {
    emit(CastLoading());
    try {
      var res = Dio().get(
        "https://api.themoviedb.org/3/movie/$id/credits?language=en-US",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2JiMGFkNmVhZjkxNzQ0NThmNjM3YzAyMTdhZDNiZiIsIm5iZiI6MTc2MTM5NzQwNS43NjEsInN1YiI6IjY4ZmNjYTlkM2I4MTI2ZTYyMjI3NTk1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0Q8LMMsmjZZXqYz8Bta6IQNgM9pYXasxrDtkOeEW060",
            "accept": "application/json",
          },
        ),
      );
      var castData = MovieCredits.fromJson((await res).data);
      emit(CastSuccess(cast: castData));
    } catch (e) {
      emit(CastFailure(errorMessage: e.toString()));
      rethrow;
    }
  }
}

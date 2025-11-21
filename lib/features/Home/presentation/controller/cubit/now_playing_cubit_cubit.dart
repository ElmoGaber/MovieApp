import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Home/presentation/controller/cubit/now_playing_model.dart';

part 'now_playing_cubit_state.dart';

class NowPlayingCubitCubit extends Cubit<NowPlayingCubitState> {
  NowPlayingCubitCubit() : super(NowPlayingCubitInitial());

  Future<MoviesResponse> get_now_playing() async {
    var dio = Dio();
    emit(NowPlayingCubitIsLoading());

    try {
      var res = await dio.get(
        "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2JiMGFkNmVhZjkxNzQ0NThmNjM3YzAyMTdhZDNiZiIsIm5iZiI6MTc2MTM5NzQwNS43NjEsInN1YiI6IjY4ZmNjYTlkM2I4MTI2ZTYyMjI3NTk1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0Q8LMMsmjZZXqYz8Bta6IQNgM9pYXasxrDtkOeEW060",
            "accept": "application/json",
          },
        ),
      );

      emit(NowPlayingCubitSuccess(data: MoviesResponse.fromJson(res.data)));
      return MoviesResponse.fromJson(res.data);
    } catch (e) {
      print(e);
      emit(NowPlayingCubitFailure());
      rethrow;
    }
  }
}

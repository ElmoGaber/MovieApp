import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Home/presentation/controller/cubit/now_playing_model.dart';

part 'top_rate_state.dart';

class TopRateCubit extends Cubit<TopRateState> {
  TopRateCubit() : super(TopRateInitial());

  Future<void> get_Top_Rate() async {
    Dio dio = Dio();
    emit(TopRateLoading());
    try {
      var res = await dio.get(
        "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzU4NDBjMmVkOWE1Njc2YTFhNmI2MzZmM2M4MDhiYyIsIm5iZiI6MTc2MTU3NzU3My4yMTUwMDAyLCJzdWIiOiI2OGZmOGE2NTU5YWMzODIyODEyNzYzM2UiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0._3ZlLXlQzlqUnEE0gxON4sfoEBvDPdZTdyLF-ojHVHk",
            "accept": "application/json",
          },
        ),
      );

      var data = MoviesResponse.fromJson(res.data);
      emit(TopRateSuccess(data: data));
    } catch (e) {
      emit(TopRateFailure(message: e.toString()));
      rethrow;
    }
  }
}

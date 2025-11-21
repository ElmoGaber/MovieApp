import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/MovieDetailes/presentation/controllers/RevieusCubit/ReviewModel.dart';

part 'review_cubit_state.dart';

class ReviewCubitCubit extends Cubit<ReviewCubitState> {
  ReviewCubitCubit() : super(ReviewCubitInitial());

  Future<void> Get_REVIEW_DATA(String id) async {
    Dio dio = Dio();
    emit(ReviewCubitLoading());
    try {
      var res = await dio.get(
        "https://api.themoviedb.org/3/movie/$id/reviews?language=en-US&page=1",

        options: Options(
          headers: {
            "accept": "application/json",
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2JiMGFkNmVhZjkxNzQ0NThmNjM3YzAyMTdhZDNiZiIsIm5iZiI6MTc2MTM5NzQwNS43NjEsInN1YiI6IjY4ZmNjYTlkM2I4MTI2ZTYyMjI3NTk1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0Q8LMMsmjZZXqYz8Bta6IQNgM9pYXasxrDtkOeEW060",
          },
        ),
      );
      var data = MovieReviewsResponse.fromJson(res.data);
      emit(ReviewCubitSuccess(Review_data: data));
    } catch (e) {
      emit(ReviewCubitFailure(errorMessage: e.toString()));
      rethrow;
    }
  }
}

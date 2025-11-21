import 'package:hive/hive.dart';
import 'package:movie_app/core/model/moviemodel.dart';

class localDataHelper {
  static Box? movies;

  static void init() {
    movies = Hive.box<MovieModel>('moviesBox');
  }
}

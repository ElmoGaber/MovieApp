import 'package:hive/hive.dart';
part 'moviemodel.g.dart';

@HiveType(typeId: 0)
class MovieModel {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final String? backdropPath;
  @HiveField(2)
  final List<int> genreIds;
  @HiveField(3)
  final int id;
  @HiveField(4)
  final String originalLanguage;
  @HiveField(5)
  final String originalTitle;
  @HiveField(6)
  final String overview;
  @HiveField(7)
  final double popularity;
  @HiveField(8)
  final String? posterPath;
  @HiveField(9)
  final String releaseDate;
  @HiveField(10)
  final String title;
  @HiveField(11)
  final bool video;
  @HiveField(12)
  final double voteAverage;
  @HiveField(13)
  final int voteCount;

  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    adult: json['adult'],
    backdropPath: json['backdrop_path'],
    genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
    id: json['id'],
    originalLanguage: json['original_language'],
    originalTitle: json['original_title'],
    overview: json['overview'],
    popularity: (json['popularity'] as num).toDouble(),
    posterPath: json['poster_path'],
    releaseDate: json['release_date'],
    title: json['title'],
    video: json['video'],
    voteAverage: (json['vote_average'] as num).toDouble(),
    voteCount: json['vote_count'],
  );

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genre_ids': genreIds,
    'id': id,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
}

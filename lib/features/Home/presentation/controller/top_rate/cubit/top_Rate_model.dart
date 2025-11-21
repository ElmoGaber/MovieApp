import 'package:movie_app/core/model/moviemodel.dart';

class TopRateMoviesResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  TopRateMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TopRateMoviesResponse.fromJson(Map<String, dynamic> json) {
    return TopRateMoviesResponse(
      page: json['page'],
      results: (json['results'] as List)
          .map((item) => MovieModel.fromJson(item))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => e.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}

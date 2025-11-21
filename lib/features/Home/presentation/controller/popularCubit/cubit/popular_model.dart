import 'dart:convert';

import 'package:movie_app/core/model/moviemodel.dart';

class MovieResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      page: json['page'] as int? ?? 0,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int? ?? 0,
      totalResults: json['total_results'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'results': results.map((m) => m.toJson()).toList(),
    'total_pages': totalPages,
    'total_results': totalResults,
  };

  /// helper: parse from raw json string
  static MovieResponse fromRawJson(String str) =>
      MovieResponse.fromJson(json.decode(str) as Map<String, dynamic>);

  /// helper: encode to raw json string
  String toRawJson() => json.encode(toJson());
}

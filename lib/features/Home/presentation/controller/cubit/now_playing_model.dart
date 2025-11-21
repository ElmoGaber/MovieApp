import 'dart:convert';

import 'package:movie_app/core/model/moviemodel.dart';

class MoviesResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
      page: json['page'],
      results: List<MovieModel>.from(
        json['results'].map((x) => MovieModel.fromJson(x)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'results': results.map((x) => x.toJson()).toList(),
    'total_pages': totalPages,
    'total_results': totalResults,
  };

  static MoviesResponse fromRawJson(String str) =>
      MoviesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}

class Dates {
  final String maximum;
  final String minimum;

  Dates({required this.maximum, required this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) =>
      Dates(maximum: json['maximum'], minimum: json['minimum']);

  Map<String, dynamic> toJson() => {'maximum': maximum, 'minimum': minimum};
}

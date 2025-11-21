class MovieReviewsResponse {
  final int? id;
  final int? page;
  final List<Review>? results;
  final int? totalPages;
  final int? totalResults;

  MovieReviewsResponse({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieReviewsResponse.fromJson(Map<String, dynamic> json) {
    return MovieReviewsResponse(
      id: json['id'],
      page: json['page'],
      results: json['results'] != null
          ? List<Review>.from(json['results'].map((x) => Review.fromJson(x)))
          : [],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'page': page,
      'results': results?.map((x) => x.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}

class Review {
  final String? author;
  final AuthorDetails? authorDetails;
  final String? content;
  final String? createdAt;
  final String? id;
  final String? updatedAt;
  final String? url;

  Review({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      author: json['author'],
      authorDetails: json['author_details'] != null
          ? AuthorDetails.fromJson(json['author_details'])
          : null,
      content: json['content'],
      createdAt: json['created_at'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'author_details': authorDetails?.toJson(),
      'content': content,
      'created_at': createdAt,
      'id': id,
      'updated_at': updatedAt,
      'url': url,
    };
  }
}

class AuthorDetails {
  final String? name;
  final String? username;
  final String? avatarPath;
  final double? rating;

  AuthorDetails({this.name, this.username, this.avatarPath, this.rating});

  factory AuthorDetails.fromJson(Map<String, dynamic> json) {
    return AuthorDetails(
      name: json['name'],
      username: json['username'],
      avatarPath: json['avatar_path'],
      rating: json['rating'] != null
          ? (json['rating'] is int
                ? (json['rating'] as int).toDouble()
                : json['rating'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'avatar_path': avatarPath,
      'rating': rating,
    };
  }
}

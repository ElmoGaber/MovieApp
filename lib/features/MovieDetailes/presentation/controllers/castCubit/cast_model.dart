class MovieCredits {
  final int? id;
  final List<Cast>? cast;
  final List<Crew>? crew;

  MovieCredits({this.id, this.cast, this.crew});

  factory MovieCredits.fromJson(Map<String, dynamic> json) {
    return MovieCredits(
      id: json['id'],
      cast: json['cast'] != null
          ? List<Cast>.from(json['cast'].map((x) => Cast.fromJson(x)))
          : [],
      crew: json['crew'] != null
          ? List<Crew>.from(json['crew'].map((x) => Crew.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cast': cast?.map((x) => x.toJson()).toList(),
      'crew': crew?.map((x) => x.toJson()).toList(),
    };
  }
}

class Cast {
  final int? id;
  final String? name;
  final String? character;
  final String? profilePath;
  final int? castId;
  final int? order;
  final String? creditId;

  Cast({
    this.id,
    this.name,
    this.character,
    this.profilePath,
    this.castId,
    this.order,
    this.creditId,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      profilePath: json['profile_path'],
      castId: json['cast_id'],
      order: json['order'],
      creditId: json['credit_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'character': character,
      'profile_path': profilePath,
      'cast_id': castId,
      'order': order,
      'credit_id': creditId,
    };
  }
}

class Crew {
  final int? id;
  final String? name;
  final String? department;
  final String? job;
  final String? profilePath;
  final String? creditId;

  Crew({
    this.id,
    this.name,
    this.department,
    this.job,
    this.profilePath,
    this.creditId,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      id: json['id'],
      name: json['name'],
      department: json['department'],
      job: json['job'],
      profilePath: json['profile_path'],
      creditId: json['credit_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'department': department,
      'job': job,
      'profile_path': profilePath,
      'credit_id': creditId,
    };
  }
}

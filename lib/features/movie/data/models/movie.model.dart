

import 'package:flutter_examples/features/movie/domain/entities/movie.entitie.dart';

class MovieModel extends Movie {
  const MovieModel({
    super.backdropPath,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.voteAverage,
    super.voteCount,
  });

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        backdropPath: json['backdrop_path'] != null
            ? json['backdrop_path'] as String
            : null,
        id: json['id'] as num,
        originalLanguage: json['original_language'] != null
            ? json['original_language'] as String
            : null,
        originalTitle: json['original_title'] != null
            ? json['original_title'] as String
            : null,
        overview: json['overview'] != null ? json['overview'] as String : null,
        popularity:
            json['popularity'] != null ? json['popularity'] as num : null,
        posterPath:
            json['poster_path'] != null ? json['poster_path'] as String : null,
        releaseDate: json['release_date'] != null
            ? json['release_date'] as String
            : null,
        title: json['title'] != null ? json['title'] as String : null,
        voteAverage: json['vote_average'] != null
            ? json['vote_average']  as num
            : null,
        voteCount:
            json['vote_count'] != null ? json['vote_count'] as num : null,
      );
}

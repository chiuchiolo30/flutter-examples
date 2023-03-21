import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  const Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.isExpandable = false,
    this.position = 0.0,
  });

  final bool? adult;
  final String? backdropPath;
  final List<num>? genreIds;
  final num? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final num? voteAverage;
  final num? voteCount;
  final bool? isExpandable;
  final double position;

  Movie copyWith({
    bool? adult,
    String? backdropPath,
    List<num>? genreIds,
    num? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    num? voteAverage,
    num? voteCount,
    bool? isExpandable,
    double? position,
  }) =>
      Movie(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
        isExpandable: isExpandable ?? this.isExpandable,
        position: position ?? this.position,
      );

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        isExpandable,
        position,
      ];
}

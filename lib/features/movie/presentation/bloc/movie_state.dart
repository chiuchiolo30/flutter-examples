part of 'movie_bloc.dart';

class MovieState extends Equatable {
  const MovieState({required this.movies});

  factory MovieState.init() => const MovieState(movies: []);

  final List<Movie> movies;

  MovieState copyWhit({List<Movie>? movies}) => MovieState(
        movies: movies ?? this.movies,
      );

  @override
  List<Object> get props => [];
}

part of 'movie_bloc.dart';

class MovieState extends Equatable {
  const MovieState({required this.movies, required this.isLoading });

  factory MovieState.init() => const MovieState(movies: [], isLoading: true);

  final List<Movie> movies;
  final bool isLoading;

  MovieState copyWith({List<Movie>? movies, bool? isLoading }) => MovieState(
        movies: movies ?? this.movies,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [movies, isLoading];
}

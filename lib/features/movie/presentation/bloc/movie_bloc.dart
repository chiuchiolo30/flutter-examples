import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_examples/features/movie/domain/index.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({required GetMoviesUsecase getMoviesUsecase})
      : getMovies = getMoviesUsecase,
        super(MovieState.init()) {
    on<GetMovies>(_getMovies);
    on<IsExpandable>(_isExpandable);
    on<ResetMovies>(_resetMovies);
  }

  final GetMoviesUsecase getMovies;

  FutureOr<void> _getMovies(GetMovies event, Emitter<MovieState> emit) async {
    final movies = await getMovies();

    emit(state.copyWith(movies: movies));
  }

  FutureOr<void> _isExpandable(IsExpandable event, Emitter<MovieState> emit) {
    final index = event.index;

    final newList = state.movies
        .asMap()
        .map<int, Movie>((key, value) {
          if (index == key) {
            return MapEntry<int, Movie>(
                key, value.copyWith(isExpandable: !value.isExpandable!),);
          }
          return MapEntry<int, Movie>(key, value.copyWith(isExpandable: false));
        })
        .values
        .toList();

    emit(state.copyWith(movies: newList, isLoading: false));
  }

  FutureOr<void> _resetMovies(ResetMovies event, Emitter<MovieState> emit) {
    emit(MovieState.init());
  }
}

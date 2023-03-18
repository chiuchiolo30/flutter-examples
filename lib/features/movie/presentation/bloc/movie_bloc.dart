import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_examples/features/movie/domain/index.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {

  MovieBloc({ required GetMoviesUsecase getMoviesUsecase })
      : getMovies = getMoviesUsecase,
        super(MovieState.init()) {
    on<GetMovies>(_getMovies);
  }

  final GetMoviesUsecase getMovies;

  FutureOr<void> _getMovies(GetMovies event, Emitter<MovieState> emit) async {
    final movies = await getMovies();

    emit(state.copyWhit(movies: movies));

  }
}

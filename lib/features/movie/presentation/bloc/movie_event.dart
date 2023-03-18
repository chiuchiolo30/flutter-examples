part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMovies extends MovieEvent {}

class ResetMovies extends MovieEvent {}

class IsExpandable extends MovieEvent {
  const IsExpandable({required this.index});
  final int index;
}

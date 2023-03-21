part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMovies extends MovieEvent {}

class ResetMovies extends MovieEvent {}

class IsExpandable extends MovieEvent {
  const IsExpandable({required this.index, required this.width});
  final int index;
  final double width;
}

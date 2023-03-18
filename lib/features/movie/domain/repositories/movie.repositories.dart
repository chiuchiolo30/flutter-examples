// ignore_for_file: one_member_abstracts

import 'package:flutter_examples/features/movie/domain/entities/movie.entitie.dart';

abstract class MovieRepository {

  Future<Movie?> getMovies();
  
}

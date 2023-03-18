import 'package:flutter_examples/features/movie/data/datasource/api/movie.api.datasource.dart';
import 'package:flutter_examples/features/movie/domain/index.dart';

class MovieRepositoryImpl extends MovieRepository {

  MovieRepositoryImpl(this.api);

  final MovieApiDatasource api;

  @override
  Future<Movie?> getMovies() => api.getMovies();
  
}

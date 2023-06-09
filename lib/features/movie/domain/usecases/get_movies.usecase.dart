import 'package:flutter_examples/features/movie/domain/index.dart';

class GetMoviesUsecase {
  
    const GetMoviesUsecase(this.repository);
  
    final MovieRepository repository;
  
    Future<List<Movie>?> call() async => repository.getMovies();
    
  }

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_examples/common/index.dart';
import 'package:flutter_examples/features/movie/index.dart';

// ignore: one_member_abstracts
abstract class MovieApiDatasource {
  Future<List<Movie>?> getMovies();
}

class MovieApiDatasourceImpl extends MovieApiDatasource {
  MovieApiDatasourceImpl(this.http);

  final DioAdapter http;

  @override
  Future<List<Movie>?> getMovies() async {
    const url = 'https://api.themoviedb.org/3/discover/movie';
    const queryParameters = <String, dynamic>{
      'api_key': 'd5b5d5f9fe80638dcaa9a843e5ec2398',
      'language': 'es-ES',
      'sort_by': 'popularity.desc',
      'include_adult': false,
      'include_video': false,
      'page': 1,
      'with_watch_monetization_types': 'flatrate',
    };
    final res = await http.get<HttpError, Response<dynamic>>(
      url: url,
      queryParameters: queryParameters,
    );

    return res.fold(
      (error) {
        log('error.e: ${error.e} error.stacktrace: ${error.stackTrace}');
        return null;
      },
      (response) {
        final data = response.data as Map<String, dynamic>;
        final aux = data['results'] as List<dynamic>;
        final cast = aux.cast<Map<String, dynamic>>();
        final movies = cast.map(MovieModel.fromMap).toList();
        return movies;
      },
    );
  }
}

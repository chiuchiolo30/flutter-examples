
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_examples/common/index.dart';
import 'package:flutter_examples/features/movie/domain/entities/movie.entitie.dart';

// ignore: one_member_abstracts
abstract class MovieApiDatasource {
  Future<Movie?> getMovies();
}

class MovieApiDatasourceImpl extends MovieApiDatasource {
  MovieApiDatasourceImpl(this.http);

  final DioAdapter http;

  @override
  Future<Movie?> getMovies() async {
    const url = 'https://api.themoviedb.org/3/discover/movie';
    const queryParameters = <String, dynamic>{
      'api_key': 'd5b5d5f9fe80638dcaa9a843e5ec2398',
      'language': 'en-US',
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
      (error) => null,
      (response) {
        final data = json.decode(response.data as String);
        return null;
      },
    );
  }
}

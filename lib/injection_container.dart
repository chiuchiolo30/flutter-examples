import 'package:dio/dio.dart';
import 'package:flutter_examples/common/adapters/index.dart';
import 'package:flutter_examples/features/movie/index.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> setup() async {
  sl
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton(() => DioAdapter(sl()))
    ..registerLazySingleton<MovieApiDatasource>(
        () => MovieApiDatasourceImpl( sl() ), )
    ..registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl( sl() ), )
    ..registerLazySingleton(
        () => GetMoviesUsecase( sl() ), )
    ..registerSingleton(MovieBloc(getMoviesUsecase: sl() ));
        
}

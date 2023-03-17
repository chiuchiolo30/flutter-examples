import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_examples/common/entities/http_error.entitie.dart';
import 'package:flutter_examples/common/interfaces/http.interface.dart';

class DioAdapter extends HttpInterface {
  DioAdapter(this.dio);
  final Dio dio;

 @override
  Future<Either<L, R>> delete<L, R>({
    required String url,
  }) async {
    try {
      final response = await dio.delete<dynamic>(url);
      return Right(response.data as R);
    } catch (e, s) {
      if (e is DioError) return Left(HttpError(error: e, stackTrace: s) as L);
      return Left(HttpError(e: e, stackTrace: s) as L);
    }
  }

 @override
  Future<Either<L, R>> download<L, R>({
    required String url,
    required String directory,
  }) async {
    try {
      final response = await dio.download(url, directory);
      return Right(response as R);
    } catch (e, s) {
      if (e is DioError) return Left(HttpError(error: e, stackTrace: s) as L);
      return Left(HttpError(e: e, stackTrace: s) as L);
    }
  }

  @override
  Future<Either<L, R>> get<L, R>({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await dio.get<dynamic>(
        url,
        queryParameters: queryParameters,
      );
      return Right(result.data as R);
    } catch (e, s) {
      if (e is DioError) return Left(HttpError(error: e, stackTrace: s) as L);
      return Left(HttpError(e: e, stackTrace: s) as L);
    }
  }

  @override
  Future<Either<L, R>> post<L, R>({
    required String url,
    dynamic data,
  }) async {
    try {
      final response = await dio.post<dynamic>(url, data: data);
      return Right(response.data as R);
    } catch (e, s) {
      if (e is DioError) return Left(HttpError(error: e, stackTrace: s) as L);
      return Left(HttpError(e: e, stackTrace: s) as L);
    }
  }

  @override
  Future<Either<L, R>> put<L, R>({
    required String url,
  }) async {
    try {
      final response = await dio.put<dynamic>(url);
      return Right(response.data as R);
    } catch (e, s) {
      if (e is DioError) return Left(HttpError(error: e, stackTrace: s) as L);
      return Left(HttpError(e: e, stackTrace: s) as L);
    }
  }
}

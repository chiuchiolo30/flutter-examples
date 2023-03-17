import 'package:dartz/dartz.dart';
import 'package:flutter_examples/common/interfaces/index.dart';

class HttpAdapter implements HttpInterface {

  
  @override
  Future<Either<L, R>> delete<L, R>({required String url}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<L, R>> download<L, R>({
    required String url,
    required String directory,
  }) {
    // TODO: implement download
    throw UnimplementedError();
  }

  @override
  Future<Either<L, R>> get<L, R>({
    required String url,
    dynamic queryParameters,
  }) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<L, R>> post<L, R>({
    required String url,
    dynamic data,
  }) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Either<L, R>> put<L, R>({required String url}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
